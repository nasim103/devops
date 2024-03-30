#!/apps/IPsoft/perl/bin/perl

##########################################################################
#
# Copyright IPsoft 2017
#
# $Revision: 1.20 $
# $Author: sgadge $
# $Id: check_log_content.pl,v 1.10 2017-07-31 14:37:07 ychandra Exp $
#
##########################################################################

use warnings;
use strict;

use POSIX qw(strftime);
use Getopt::Long;
use File::Glob ':glob';
use IPsoft::LogTail;
use IPsoft::IPmonCheck;
use IPsoft::ConfigFile qw( read_config write_config );

my $ipmon = new IPsoft::IPmonCheck;
$ipmon->run( \&check_log, @ARGV );
$ipmon->finish();
exit 0;

sub check_log {
    my ( $ipmon, @args ) = @_;
    my ( $state, $msg );
    my %states_config;

    # get STATUS from module so that it will not be defined in 2 different places
    my %STATES = %IPsoft::IPmonCheck::STATUS;

    my %opt;

    {
        local @ARGV = @args;
        my $result = GetOptions(
            \%opt,
            'conf_file|f=s',
            'log_file|l=s',
            'date_format|d=s',
            'offset_ext|e=s',
            'logtail_offset|o=s',
            'state_file|t=s',
            'linear|i',
            'silent|s',
            'linebreak',
            'glob',
            'verbose',
            # overwrite the system base_path value
            'basepath=s',
            # reset the count if consecutive lines are not matching pattern
            'consecutive',
            'problems_only',
        );
        @args = @ARGV;
    }

    my $logfile    = $opt{'log_file'};
    my $cfgfile    = $opt{'conf_file'};
    my $silent     = $opt{'silent'};
    my $dateformat = $opt{'date_format'};
    my $linebreak  = $opt{'linebreak'};
    my $glob       = $opt{'glob'};
    my $base_path  = defined $opt{'basepath'} ? $opt{'basepath'} : '';

    if (!defined $opt{'basepath'}) {
            $base_path = ( $ipmon->can('get_base_path') )
            ? $ipmon->get_base_path . '/etc'
            : '/apps/IPsoft/IPremote/etc'
            ;
    }

    # look for config file in IPremote etc if it does not start with q{/}
    if ( defined $cfgfile && substr( $cfgfile, 0, 1 ) ne q{/} ) {
        $cfgfile = join q{/}, "$base_path", $cfgfile;
    }

    if ( !defined $cfgfile || !-f $cfgfile ) {
        $ipmon->state( 'UNKNOWN', "No config specified" );
        return 1;
    }

    if ( !defined $logfile ) {
        $ipmon->state( 'UNKNOWN', "No log specified" );
        return 1;
    }

    if ( defined $dateformat ) {
        if ( $dateformat !~ /(?:\%[-_%a-z])+/ ) {
            $ipmon->state( 'UNKNOWN', "Invalid date format: $dateformat" );
            return 1;
        }
        my $date = strftime $dateformat, localtime;
        $logfile =~ s/\%DATE\%/$date/g;
    }

    # find last modified log based on glob name specified
    if ( defined $glob) {
        $logfile = get_last_modified_logfile( $ipmon, $logfile );
        unless ( defined $logfile ) {
            $msg = "No log file found matching specified glob pattern";
            if ( defined $silent ) {
                $ipmon->state( 'OK', $msg );
            }
            else {
                $ipmon->state( 'UNKNOWN', $msg );
            }
            return 1;
        }
    }

    my $offset_ext = ( exists $opt{'offset_ext'} ) ? $opt{'offset_ext'} : 'chkoffset';
    my $logtail_offset = ( ( exists $opt{'logtail_offset'} ) ? $opt{'logtail_offset'} : $logfile ) . ".$offset_ext";

    my $statefile = ( ( exists $opt{'state_file'} ) ? $opt{'state_file'} : $logfile ) . ".chkstate";

    open( CFG, "<$cfgfile" );

    # Read config file
    my %cfg;
    while (<CFG>) {
        next if /^\s*(#|$)/;
        chomp;
        my ( $name, $state, $min, $max, $regex ) = split( /;/, $_, 5 );

        # Linear checking
        if ( defined $opt{'linear'} ) {
            if ( !exists $cfg{$name}{$state} ) {
                $cfg{$name}{'states'}{$state}{'regex'} = qr/$regex/i;
            }

            if ( !exists $cfg{$name}{'state'} ) {
                $cfg{$name}{'state'} = 'OK';
            }

            $cfg{$name}{'msg'} = 'No messages detected';
        }

        # Bucket checking
        # (consecutive checking follows same logic)
        else {

            if ( !exists $cfg{$name}{'regex'} ) {
                $cfg{$name}{'regex'} = qr/$regex/i;
            }
            if ( !exists $cfg{$name}{'seq'} ) {
                $cfg{$name}{'seq'} = $.;
            }
            if ( !length $min ) { undef $min; }
            if ( !length $max ) { undef $max; }

            $cfg{$name}{$state} = { 'min' => $min, 'max' => $max };
            $cfg{$name}{'count'} = 0;
            $cfg{$name}{'msg'}   = '';
        }
    }

    close(CFG);

    # Linear checking - seed last seen states
    if ( defined $opt{'linear'} ) {
        read_config( $statefile, \%states_config );
        foreach my $name ( keys %{ $states_config{'state'} } ) {
            ( $cfg{$name}{'state'}, $cfg{$name}{'msg'} ) = split( /;/, $states_config{'state'}{$name}[0], 2 );
        }
    }

    my $log = new IPsoft::LogTail( 'File' => $logfile, 'OffsetFile' => $logtail_offset );

    my ( $logdata, $logmesg ) = $log->open();

    unless ($logdata) {
        if ( defined $silent ) {
            if ( defined $logmesg && $logmesg =~ /No such file or directory/ ) {
                $ipmon->state( 'OK', "Ignoring non-existent log file" );
                return 1;
            }

            $ipmon->state( 'UKNOWN', "Failure reading $logfile.  Please verify permissions" );
            return 1;
        }
        else {
            $ipmon->state( 'CRITICAL', "Could not open $logfile" );
            return 1;
        }
    }

    my $prev_line;
    # read the log file line at a time
    while (<$logdata>) {
        my $count;
        my $line = $_;
        chomp $line;

        # Linear checking - last message for a state wins
        if ( defined $opt{'linear'} ) {

            foreach my $name ( keys %cfg ) {
                foreach my $state ( keys %{ $cfg{$name}{'states'} } ) {
                    if ( $line =~ /($cfg{$name}{'states'}{$state}{'regex'})/ ) {
                        $cfg{$name}{'msg'}   = $1;
                        $cfg{$name}{'state'} = $state;
                    }
                }
            }
        }

        # consecutive checking - keep max number of consecutive occurences
        elsif ( defined $opt{'consecutive'} ) {

            foreach my $name ( sort { $cfg{$a}{'seq'} <=> $cfg{$b}{'seq'} } keys %cfg ) {

                # if this is the first line and we find matching patter
                # increment current count
                if ( !defined $prev_line
                    && ( $count = $line =~ /$cfg{$name}{'regex'}/ )
                ) {
                    $cfg{$name}{'msg'} .= "$line;";
                    $cfg{$name}{'count'} += $count;
                }
                # if there were lines before this one, in order to increment
                # count, previous line must match this regex, or its current
                # count is 0, and current line also matches the regex
                elsif ( defined $prev_line
                    && ( $prev_line =~ /$cfg{$name}{'regex'}/ || $cfg{$name}{'count'} == 0 )
                    && ( $count = $line =~ /$cfg{$name}{'regex'}/ )
                ) {
                    $cfg{$name}{'msg'} .= "$line;";
                    $cfg{$name}{'count'} += $count;
                }
                # this pattern did not match
                # keep last max count and reset current values
                else {
                    if ( !defined $cfg{$name}{'last_count'}
                        || ( defined $cfg{$name}{'last_count'}
                        && $cfg{$name}{'last_count'} < $cfg{$name}{'count'} )
                    ) {
                        $cfg{$name}{'last_msg'} = $cfg{$name}{'msg'};
                        $cfg{$name}{'last_count'} = $cfg{$name}{'count'};
                    }
                    $cfg{$name}{'msg'} = '';
                    $cfg{$name}{'count'} = 0;
                }
            }
        }

        # Bucket checking - worst bucket wins
        else {

            foreach my $name ( sort { $cfg{$a}{'seq'} <=> $cfg{$b}{'seq'} } keys %cfg ) {

                if ( $count = $line =~ /$cfg{$name}{'regex'}/ ) {
                    $cfg{$name}{'msg'} .= "$line;";
                    $cfg{$name}{'count'} += $count;
                    last;
                }
            }
        }

        # current line becomes previous line
        $prev_line = $line;
    }

    if ( !$log->close() ) {
        $ipmon->state( 'CRITICAL', "Could not close $logfile: $!" );
        return 1;
    }

    # Consecutive
    # make sure that in the end max counts are used
    if ( $opt{'consecutive'} ) {
        foreach my $name ( sort { $cfg{$a}{'seq'} <=> $cfg{$b}{'seq'} } keys %cfg ) {
            next if !exists $cfg{$name}{'last_count'};

            if ( defined $cfg{$name}{'last_count'}
                && $cfg{$name}{'last_count'} > $cfg{$name}{'count'}
            ) {
                $cfg{$name}{'msg'} = $cfg{$name}{'last_msg'};
                $cfg{$name}{'count'} = $cfg{$name}{'last_count'};
            }
        }
    }

    my $logtext = '';
    $msg = '';

    # Linear checking - assemble ipmon message that is to be shown
    if ( defined $opt{'linear'} ) {
        my @output_bits;

        foreach my $name ( keys %cfg ) {
            $states_config{'state'}{$name}[0] = $cfg{$name}{'state'} . ";" . $cfg{$name}{'msg'};
            if ( defined $opt{'verbose'} ) {
                push( @output_bits, "$name: " . $cfg{$name}{'msg'} );
            }
            else {
                push( @output_bits, $cfg{$name}{'msg'} );
            }
        }

        unless ( write_config( $statefile, \%states_config ) ) {
            $ipmon->state( 'UNKNOWN', "Could not save states to $statefile" );
            return 1;
        }

        # Join bits together
        $logtext = join( ";", @output_bits );

    }

    # Bucket checking - assemble ipmon message that is to be shown
    # (consecutive checking does exact same count verifications)
    else {

        $state = $STATES{'UNKNOWN'};

        foreach my $name ( sort { $cfg{$a}{'seq'} <=> $cfg{$b}{'seq'} } keys %cfg ) {
            foreach my $tmpstate ( keys %STATES ) {
                next if ( !exists $cfg{$name}{$tmpstate} );
                # do not show OK matches if only problems are to be shown
                next if $opt{'problems_only'} && $tmpstate eq 'OK';

                my $min   = $cfg{$name}{$tmpstate}{'min'};
                my $max   = $cfg{$name}{$tmpstate}{'max'};
                my $count = $cfg{$name}{'count'};

                if ( value_within_threshold( $count, $min, $max ) ) {
                    my $plural = ( $count == 1 ) ? "" : "s";

                    $msg     .= "$name matched $count time$plural; ";
                    $logtext .= $cfg{$name}{'msg'};

                }
            }
        }

        if ( !length $msg ) {
            $ipmon->state( 'OK', 'Log file is clean.' );
            return 1;
        }
    }

    $msg =~ s/\n/\<br\>/g
        if defined $linebreak;

    $logtext =~ s/[\r\n]*//g;
    $logtext =~ s/['"]//g;

    #$msg = substr($msg . $logtext,0,512);
    $msg .= $logtext;
    $msg =~ s/&/&amp;/g;
    $msg =~ s/</&lt;/g;
    $msg =~ s/>/&gt;/g;

    # pipes in logs are evil
    $msg =~ s/\|//g;

    # Linear checking - set ipmon state and message
    if ( defined $opt{'linear'} ) {

        foreach my $name ( keys %cfg ) {
            $ipmon->state( $cfg{$name}{'state'}, $msg );
        }
    }

    # Bucket checking - set ipmon state and message
    else {

        foreach my $name ( keys %cfg ) {
            foreach my $tmpstate ( keys %STATES ) {
                next if ( !exists $cfg{$name}{$tmpstate} );

                my $min   = $cfg{$name}{$tmpstate}{'min'};
                my $max   = $cfg{$name}{$tmpstate}{'max'};
                my $count = $cfg{$name}{'count'};

                if ( value_within_threshold( $count, $min, $max ) ) {
                    $ipmon->state( $tmpstate, $msg );
                }
            }
        }
    }

    return 1;
}

sub value_within_threshold {
    my ( $value, $min, $max ) = @_;

    if ( !defined $min ) { $min = -1; }
    if ( !defined $max ) { $max = -1; }

    if (!( $min == -1 && $max == -1 )
        && (   ( $min == -1 && $value <= $max )
            || ( $max == -1     && $value >= $min )
            || ( $value <= $max && $value >= $min ) )
        )
    {
        return 1;
    }
    else {
        return 0;
    }
}

sub get_last_modified_logfile {
    my ( $ipmon, $file ) = @_;

    my $latest_logfile;
    my $latest_logfile_mtime = 0;

    my @logfile_list = glob($file);

    foreach my $file (@logfile_list) {
        my $mtime = ( stat $file )[9];

        if ( $mtime > $latest_logfile_mtime ) {
            $latest_logfile_mtime = $mtime;
            $latest_logfile       = $file;
        }
    }

    return $latest_logfile;
}
__END__

=head1 NAME

C<check_log_content.pl> - This is a deprecated check.

=head1 DESCRIPTION

This is a deprecated check.  It has been replaced by the module IPsoft::IPmonCheck::System::UNIX::LogContent.

If you are looking at this check for any reason, you should be instead replacing your use of this check.

=cut
