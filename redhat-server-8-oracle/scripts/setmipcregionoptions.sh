#!/bin/bash

#  This file is copied to /usr/local/bin/mipc
#  A cron job will execute this script at reboot.

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/cgiadmin/.local/bin:/home/cgiadmin/bin:/bin/sbin
sudo chmod 750 /var/lib/pcp
sudo chmod 750 /etc/unbound
sudo chmod 750 /var/lib/chrony
sudo chmod 750 /var/lib/nfs

LOG_FILE="/usr/local/bin/mipc/regionalsettingslog.txt"
if [ ! -f $LOG_FILE ]; then
   echo "Log file for setting mipc regional options does not exist, creating.."
   touch $LOG_FILE
fi

####   See:  https://proactionus.ent.cgi.com/confluence/display/ROBOT/Naming+Conventions 

echo $HOSTNAME
if [[ $HOSTNAME == p* ]] || [[ $HOSTNAME == pdc* ]]; then
	echo "This is Phoenix"
    /bin/echo "Configuring proxy settings for Phoenix." >> $LOG_FILE
    cp /usr/tmp/rsyslog.conf.phx /etc/rsyslog.conf
    #  Rancher nodes do not leverage Cortex at this time.   TwistLock/Prisma Cloud is used instead.
    #  /opt/traps/bin/cytool proxy set 10.160.2.6:8080
    # Proxy stuff
    if [ -f /etc/profile.d/proxy.sh ]; then
        sed -i "s/10.160.60.14/10.160.2.6/gi" /etc/profile.d/proxy.sh
    fi
    if [ -f /etc/environment ]; then
        sed -i "s/10.160.60.14/10.160.2.6/gi" /etc/environment
    fi    
    if [ -f /etc/rsyslog.conf ]; then
        sed -i "s/10.116.5.40/10.106.24.40/gi" /etc/rsyslog.conf
    fi
fi

if [[ $HOSTNAME == r* ]]  || [[ $HOSTNAME == phl* ]]; then
	echo "This is Philly"
    /bin/echo "Configuring proxy settings for Philly." >> $LOG_FILE
    cp /usr/tmp/rsyslog.conf.phl /etc/rsyslog.conf
    # Proxy stuff
    if [ -f /etc/profile.d/proxy.sh ]; then
        sed -i "s/10.160.2.6/10.160.60.14/gi" /etc/profile.d/proxy.sh
    fi
    if [ -f /etc/environment ]; then
        sed -i "s/10.160.2.6/10.160.60.14/gi" /etc/environment
    fi     
    if [ -f /etc/rsyslog.conf ]; then
        sed -i "s/10.106.24.40/10.116.5.40/gi" /etc/rsyslog.conf
    fi
fi
systemctl restart rsyslog
iptables -A OUTPUT -p icmp --icmp-type timestamp-reply -j DROP
iptables -A INPUT -p icmp --icmp-type timestamp-request -j DROP

