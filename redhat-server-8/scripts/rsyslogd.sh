sudo rm -rf  /etc/rsyslog.conf
sudo cp /tmp/95-omsagent.conf /etc/rsyslog.d/
sudo cp /tmp/rsyslog.conf /etc/
sudo chmod 0644 /etc/rsyslog.conf
sudo chmod 0644 /etc/rsyslog.d/95-omsagent.conf