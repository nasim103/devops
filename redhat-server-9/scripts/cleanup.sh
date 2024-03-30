#!/bin/bash

hostnamectl

sudo rm -rf /tmp/ga_issuing.cer
sudo rm -rf /tmp/ga_root.cer


#install SOS
dnf install -y sos
dnf install -y bind-utils
dnf -y remove tuned

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
sudo chage -I -1 -m 0 -M 99999 -E -1 cgiadmin || true
sudo chage -I -1 -m 0 -M 99999 -E -1 svc_forescout  || true

# Unregister from the satelite server
echo "Disconnecting this machine from the satellite servers."
sudo subscription-manager unregister
sudo subscription-manager clean

# clean up build files used
sudo chown root:root /etc/postfix/main.cf || true
sudo rm -rf /var/spool/mail/cgiadmin || true
sudo rm -rf /root/anaconda-ks.cfg || true
sudo rm -rf /root/pda-preload-master.sh || true
sudo rm -rf /root/original-ks.cfg || true
sudo rm -rf /tmp/* || true
chmod 750 /home/* || true

systemctl reload sshd
sudo userdel oracle || true
sudo rm -rf /home/oracle || true
sudo rm -rf /var/spool/mail/oracle || true
sudo usermod -s /usr/sbin/nologin omsagent || true
sudo usermod -s /usr/sbin/nologin nxautomation || true
sudo rm -rf /etc/authselect/custom/cis-profile.zip || true
sudo sed -i 's/PASS_MAX_DAYS 90/PASS_MAX_DAYS 365/g' /etc/ssh/sshd_config || true
sudo sed -i 's/PASS_MAX_DAYS 90/PASS_MAX_DAYS 365/g' /etc/login.defs || true
sudo systemctl --now mask systemd-journal-remote.socket
sudo find /var/log/ -type f -perm /g+wx,o+rwx -exec chmod --changes g-wx,o-rwx "{}" + || true
sudo find /var/log -type f -exec chmod g-wx,o-rwx '{}' + -o -type d -exec chmod g-wx,o-rwx '{}' + || true
sudo sed -i 's/net.ipv4.conf.default.rp_filter = 2/net.ipv4.conf.default.rp_filter = 1/g' /lib/sysctl.d/50-default.conf || true
sudo sed -i 's/net.ipv4.conf.*.rp_filter = 2/net.ipv4.conf.*.rp_filter = 1/g' /lib/sysctl.d/50-default.conf || true
sudo sed -i 's/umask 022/umask 077/g' /etc/csh.cshrc || true
sudo sed -i 's/umask 027/umask 077/g' /etc/bashrc || true
# sudo sed -i 's/FileCreateMode 0640/FileCreateMode 0600/g' /etc/rsyslog.conf || true
sudo sed -i 's/FileCreateMode 0640/FileCreateMode 0600/g' /etc/logrotate.conf || true