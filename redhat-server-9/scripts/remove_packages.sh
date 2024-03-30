#/bin/bash

echo "Removing Red Hat Insights package and dependencies"
sudo dnf -y remove insights-client
sudo dnf -y  remove nfs-utils
sudo dnf -y  remove rpcbind 
sudo dnf -y  remove bind 


sudo dnf remove git -y
sudo dnf remove bind* -y