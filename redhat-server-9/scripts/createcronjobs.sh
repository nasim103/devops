#!/bin/bash
#if [ `id -u` -ne 0 ]; then
#    echo "This script can be executed only as root, Exiting.."
#    exit 1
#fi
CRON_FILE="/var/spool/cron/root"
if [ ! -f $CRON_FILE ]; then
   echo "cron file for root does not exist, creating.."
   sudo touch $CRON_FILE
   sudo /usr/bin/crontab $CRON_FILE
fi

sudo /bin/echo "@reboot /usr/local/bin/mipc/setmipcregionoptions.sh" >> $CRON_FILE

#FOUND="$(sudo grep -ai 'setmipcregionoptions' $CRON_FILE)"
#if [ "$FOUND" == "" ] ; then
#    echo "Updating cron job for setting mipc regional options such as proxy"
#    sudo /bin/echo "@reboot /usr/local/bin/mipc/setmipcregionoptions.sh" >> $CRON_FILE
#else
#    echo "Cron job for setting mipc regional options such as proxy already exists."
#fi
