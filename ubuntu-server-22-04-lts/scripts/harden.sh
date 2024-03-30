#!/bin/bash

rm -rf ansible-role-rhel9-cis || true
 
export GIT_SSL_NO_VERIFY=true

git clone --depth 1 -b Develop https://packer:glpat-kmRTmzkVrsqJFnYo8xZv@gitlab.css.cgipdc.cginet/unix-iac/cis/public/ansible-role-rhel9-cis.git


cd ansible-role-rhel9-cis || exit


echo "Setting selinux to permissive"
setenforce 0
unset {http,https,ftp,HTTP,https,no,NO,FTP}_proxy

# python3 /usr/local/bin/ansible-playbook playbooks/harden_rh9_servers_iac.yml -i inventory/iac_localrun
python3 /usr/local/bin/ansible-playbook playbooks/harden_rh9_servers_iac.yml -i inventory/iac_localrun  --connection=local

echo "Disabling firewalld after CIS hardening"
service firewalld stop
systemctl disable firewalld --no-pager

#echo "Re-enabling TcpForwarding in SSHD after CIS hardening"
# sudo sed -i "s/AllowTcpForwarding no/AllowTcpForwarding yes/g" /etc/ssh/sshd_config

echo "Re-enabling PWDLESS sudo for wheel"
cat >> /etc/sudoers << EOF
# Re-enable pwdless sudoer for wheel
%wheel		ALL=(ALL)	NOPASSWD: ALL
EOF

update-crypto-policies --set DEFAULT:AD-SUPPORT

echo 'Storage=none' >> /etc/systemd/coredump.conf
echo 'ProcessSizeMax=0' >> /etc/systemd/coredump.conf
echo 'blacklist cramfs' >> /etc/modprobe.d/CIS.conf

echo  '* soft core 0' >> /etc/security/limits.conf
echo  '* hard core 0' >> /etc/security/limits.conf
touch /etc/dconf/db/local.d/00-media-automount
echo  '[org/gnome/desktop/media-handling]'  >> /etc/dconf/db/local.d/00-media-automount
echo  'automount=false'  >> /etc/dconf/db/local.d/00-media-automount
echo  'automount-open=false'  >> /etc/dconf/db/local.d/00-media-automount
dconf update


echo 'Defaults use_pty' >> /etc/sudoers

#not hardened enough harden me harder
sudo find /var/log -type f -exec chmod g-wx,o-rwx '{}' +
sudo sed -ri 's/^s*(CRYPTO_POLICYs*=.*)$/# 1/' /etc/sysconfig/sshd
sudo sed -i 's/ClientAliveCountMax 3/ClientAliveCountMax 0/g' /etc/ssh/sshd_config
sudo systemctl reload sshd
sudo chmod o-w  /var/opt/microsoft/omsagent/4cc297cb-ce9e-4d59-8615-230aceafd7a3/log/ODSIngestion.status || true
sudo chmod 750 /home/nxautomation || true

echo 0

rm -rf /home/cgiadmin/ansible-role-rhel9-cis || true
rm -rf /opt/RHEL9-CIS-Audit || true