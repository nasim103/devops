#!/bin/bash
# 
# Installs the vmware guestinfo package for RHEL.  Need to exist in /tmp

cd /tmp
#yum localinstall -y cloud-init-vmware-guestinfo-1.1.0-1.el7.noarch.rpm

curl -sSL https://raw.githubusercontent.com/vmware/cloud-init-vmware-guestinfo/master/install.sh | sh -
