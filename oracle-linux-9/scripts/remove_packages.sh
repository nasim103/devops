#/bin/bash
source /usr/local/bin/mipc/exportproxies.sh
echo "Removing Red Hat Insights package and dependencies"
dnf -y remove insights-client
dnf -y  remove nfs-utils
dnf -y  remove rpcbind 
dnf -y  remove bind 


yum remove git -y
yum remove bind* -y