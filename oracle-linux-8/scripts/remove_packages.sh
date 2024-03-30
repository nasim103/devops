#/bin/bash

echo "Removing Red Hat Insights package and dependencies"
source /usr/local/bin/mipc/exportproxies.sh
dnf -y remove insights-client
dnf -y  remove nfs-utils
dnf -y  remove rpcbind 
dnf -y  remove bind 


yum remove git -y
yum remove bind* -y