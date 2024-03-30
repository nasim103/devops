rm -rf  /etc/rsyslog.conf
cp /tmp/95-omsagent.conf /etc/rsyslog.d/
cp /tmp/rsyslog.conf /etc/
chmod 0644 /etc/rsyslog.conf
chmod 0644 /etc/rsyslog.d/95-omsagent.conf