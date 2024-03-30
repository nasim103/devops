#/bin/bash

echo "Removing Red Hat Insights package and dependencies"
yum -y remove insights-client
yum -y  remove nfs-utils
yum -y  remove rpcbind 
yum -y  remove bind 


yum remove git -y
yum remove bind* -y