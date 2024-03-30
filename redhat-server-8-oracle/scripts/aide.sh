aide --init || true
sleep 10
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
CRON_FILE="/var/spool/cron/root"
if [ ! -f $CRON_FILE ]; then
   echo "cron file for root does not exist, creating.."
   sudo touch $CRON_FILE
   sudo /usr/bin/crontab $CRON_FILE
fi

sudo /bin/echo "@weekly root /usr/sbin/aide --check" >> $CRON_FILE
