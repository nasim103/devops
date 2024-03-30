#!/bin/bash
#  For build, assume "west" or "phx" settings.   A cron job will modify the rsyslog setting upon boot based on the vm name.
\cp /usr/local/bin/mipc/rsyslog.conf.phx /etc/rsyslog.conf
systemctl restart rsyslog
iptables -A OUTPUT -p icmp --icmp-type timestamp-reply -j DROP
iptables -A INPUT -p icmp --icmp-type timestamp-request -j DROP

# Configure log rotation
yes | cp /tmp/syslog /etc/logrotate.d/