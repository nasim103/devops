#/bin/bash

echo "Removing Red Hat Insights package and dependencies"
dnf -y remove insights-client
dnf -y  remove nfs-utils
dnf -y  remove rpcbind 
dnf -y  remove bind 


dnf remove git -y
dnf remove bind* -y