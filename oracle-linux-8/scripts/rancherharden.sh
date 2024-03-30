#!/bin/bash
## https://rancher.com/docs/rancher/v2.x/en/security/rancher-2.4/hardening-2.4/#configure-kernel-runtime-parameters
cp /tmp/90-kubelet.conf  /etc/sysctl.d/90-kubelet.conf
sysctl -p /etc/sysctl.d/90-kubelet.conf

groupadd --gid 52034 etcd
useradd --comment "etcd service account" --uid 52034 --gid 52034 etcd

#https://rancher.com/docs/rke/latest/en/os/#red-hat-enterprise-linux-rhel--oracle-linux-ol--centos
echo 'net.bridge.bridge-nf-call-iptables=1' | sudo tee -a /etc/sysctl.conf

#sed "s/#AllowTcpForwarding*/AllowTcpForwarding yes/g" /etc/ssh/sshd_config
echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config