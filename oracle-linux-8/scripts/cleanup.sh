#!/bin/bash

hostnamectl

sudo rm -rf /tmp/ga_issuing.cer
sudo rm -rf /tmp/ga_root.cer


echo "Cleaning up old kernels *******************************************"
# dnf -y remove --oldinstallonly
sudo rm -rf /var/cache/yum || true
sudo rm -rf /var/cache/dnf || true

## Clean logs
echo "Cleaning up logs *******************************************"
truncate -s 0 /var/log/*.*
truncate -s 0 /var/log/**/*.*
find /var/log -type f -name '*.[0-99].gz' -exec rm {} +
rm -rfv /var/log/anaconda/*

# Reset the machine-id value. This has known to cause issues with DHCP
echo -n > /etc/machine-id

# Reset any existing cloud-init state
#
#cloud-init clean -s -l
# Prevent cloud-init from setting IP
#
#echo "Disabling cloud-init networking"
#bash -c "echo 'network: {config: disabled}' > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg"

#update-crypto-policies --set DEFAULT:AD-SUPPORT
sudo chage -I -1 -m 0 -M 99999 -E -1 cgiadmin
sudo chage -I -1 -m 0 -M 99999 -E -1 svc_forescout

# Unregister from the satelite server
echo "Disconnecting this machine from the satellite servers."
sudo subscription-manager unregister
sudo subscription-manager clean

# clean up build files used
sudo chown root:root /etc/postfix/main.cf
sudo rm -rf /var/spool/mail/cgiadmin
sudo rm -rf /root/anaconda-ks.cfg
sudo rm -rf /root/pda-preload-master.sh
sudo rm -rf /root/original-ks.cfg
sudo rm -rf /tmp/*
chmod 750 /home/*

systemctl reload sshd
sudo userdel oracle
sudo rm -rf /home/oracle
sudo rm -rf /var/spool/mail/oracle
sudo usermod -s /usr/sbin/nologin omsagent
sudo usermod -s /usr/sbin/nologin nxautomation
sudo rm -rf /etc/authselect/custom/cis-profile.zip
sudo sed -i 's/PASS_MAX_DAYS 90/PASS_MAX_DAYS 365/g' /etc/ssh/sshd_config
sudo find /var/log/ -type f -perm /g+wx,o+rwx -exec chmod --changes g-wx,o-rwx "{}" +
