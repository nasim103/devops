#!/bin/bash

# Rancher Node Driver requires using the "NoCloud" data source for cloud-init: https://rancher.com/docs/rancher/v2.x/en/cluster-provisioning/rke-clusters/node-pools/vsphere/vsphere-node-template-config/v2.3.3/#cloud-init
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/configuring_and_managing_cloud-init_for_rhel_8/index#the-default-cloud-cfg-file_red-hat-support-for-cloud-init
mkdir -p /etc/cloud/cloud.cfg.d
cp /tmp/99-DataSourceNoCloud.cfg /etc/cloud/cloud.cfg.d/99-DataSourceNoCloud.cfg
# https://access.redhat.com/downloads/content/rhel---7/x86_64/2473/cloud-init/0.7.5-1.el7_0/src/fd431d51/package
#echo "Installing cloud-init rpm"
#sudo rpm -i /tmp/cloud-init.rpm
#yum -y -e 0 install cloud-init
#  VMWare has an open-sourced package that allows Cloud-Init to work with vsphere guestinfo: https://github.com/vmware/cloud-init-vmware-guestinfo
echo "Installing the VMware cloud-init guestinfo data source"
sudo rpm -i /tmp/cloud-init-vmware-guestinfo-1.1.0-1.el7.noarch.rpm