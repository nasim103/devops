#!/bin/bash
mkdir -p /usr/tmp
mkdir -p /usr/local/bin/mipc
cp /tmp/rsyslog.conf.phl /usr/local/bin/mipc/
cp /tmp/rsyslog.conf.phx /usr/local/bin/mipc/
cp /tmp/setmipcregionoptions.sh /usr/local/bin/mipc/
cp /tmp/exportproxies.sh /usr/local/bin/mipc/
chmod +x /usr/local/bin/mipc/setmipcregionoptions.sh
chmod +x /usr/local/bin/mipc/exportproxies.sh
