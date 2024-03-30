#!/bin/bash

#### Configure proxy settings as appropriate. ###
export BUILD_USERNAME
export RHSM_USERNAME
export RHSM_PASSWORD
export VCENTER_ENVIRONMENT


### Assume that we want the "West" or "PHX" settings.   A shell script in /usr/local/bin is executed as a cron job at reboot that will update the proxy and syslog settings as necessary.

echo "Setting Proxy settings"
# Proxy stuff
cat <<EOT >> /etc/profile.d/proxy.sh
export http_proxy=http://10.160.2.6:8080
export https_proxy=http://10.160.2.6:8080
export ftp_proxy=http://10.160.2.6:8080
# Do not use the proxy for anything in the mipc.css.cgipdc.cginet domain or any of the CLASS A address starting with 10.
export no_proxy=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16

#   Repeated in CAPS as some tools use "http_proxy" and others use "HTTP_PROXY"
export HTTP_PROXY=http://10.160.2.6:8080
export HTTPS_PROXY=http://10.160.2.6:8080
export FTP_PROXY=http://10.160.2.6:8080
export NO_PROXY=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16
EOT

cat <<EOT >> /etc/environment
http_proxy=http://10.160.2.6:8080
https_proxy=http://10.160.2.6:8080
ftp_proxy=http://10.160.2.6:8080
# Do not use the proxy for anything in the mipc.css.cgipdc.cginet domain or any of the CLASS A address starting with 10.
no_proxy=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16

#   Repeated in CAPS as some tools use "http_proxy" and others use "HTTP_PROXY"
HTTP_PROXY=http://10.160.2.6:8080
HTTPS_PROXY=http://10.160.2.6:8080
FTP_PROXY=http://10.160.2.6:8080
NO_PROXY=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.126.0.0/16,10.127.0.0/16,10.128.0.0/16,162.0.0.0/8,10.106.0.0/16
EOT
sudo chmod u=rwx,g=rx,o=rx /etc/profile.d/proxy.sh