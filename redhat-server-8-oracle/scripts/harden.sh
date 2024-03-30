#!/bin/bash


#echo 'Oph0Du4On7Haf9Ve1Jo6Ry0' | realm leave --remove --user=svc_adjoin css.cgipdc.cginet || true
#echo 0


#  If encryption issues arise:  sudo update-crypto-policies --set DEFAULT:AD-SUPPORT
#  Omit the domain suffix for the user with RHEL8:  https://access.redhat.com/solutions/5592351
#echo 'Oph0Du4On7Haf9Ve1Jo6Ry0' | realm join --user=svc_adjoin --computer-ou="OU=IaC,OU=Unix,OU=Tier 1,OU=Staff,OU=MGMT,DC=css,DC=cgipdc,DC=cginet" css.cgipdc.cginet
#id rgouge@CSS.CGIPDC.CGINET
#realm deny --all
#realm permit --all

rm -rf ansible-role-rhel8-cis || true
 
export GIT_SSL_NO_VERIFY=true

# roncis 
#git clone --depth 1 -b devel https://packer:glpat-ao9Bzh8yp_vwp-_QY1MP@gitlab.css.cgipdc.cginet/kubernetes-automation/rhel8-cis.git
#git clone --depth 1 -b main https://packer:glpat-3WPwmjNtPEUbkEDQMLfB@gitlab.css.cgipdc.cginet/unix-iac/ron_rhel8-cis.git

#gtocis # leave on develop always
#git clone --depth 1 -b develop https://packer:glpat-DWEbxB8_8-1ZJvkZz1ze@gitlab.css.cgipdc.cginet/unix-iac/cis-gto-rhel.git
git clone --depth 1 -b Develop https://packer:glpat-CuENsyyM_Xh3rYgyS5aU@gitlab.css.cgipdc.cginet/unix-iac/cis/public/ansible-role-rhel8-cis.git

cd ansible-role-rhel8-cis || exit

which python3
python3 --version
alternatives  --list  | grep python
#python3 /usr/local/bin/ansible-playbook local.yml --tags="patch"
python3 /usr/local/bin/ansible-playbook playbooks/harden_rh8_servers_iac.yml -i inventory/iac_localrun --connection=local

# Only if we install nagios
#chmod 750 /var/spool/nagios

# Starting with Kubernetes > v1.19 disabling firewalld is recommended.
echo "Disabling firewalld after CIS hardening"
service firewalld stop
systemctl disable firewalld --no-pager
#  https://rancher.com/docs/rke/latest/en/os/#ssh-server-configuration
echo "Re-enabling TcpForwarding in SSHD after CIS hardening"
sudo sed -i "s/AllowTcpForwarding no/AllowTcpForwarding yes/g" /etc/ssh/sshd_config
echo "Setting selinux to permissive"
# setenforce 0
echo "Re-enabling PWDLESS sudo for wheel"
cat >> /etc/sudoers << EOF
# Re-enable pwdless sudoer for wheel
%wheel		ALL=(ALL)	NOPASSWD: ALL
EOF

#update-crypto-policies --set DEFAULT:AD-SUPPORT

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
# sudo sed -i 's/ClientAliveCountMax 3/ClientAliveCountMax 0/g' /etc/ssh/sshd_config
sudo systemctl reload sshd
# sudo chmod o-w  /var/opt/microsoft/omsagent/4cc297cb-ce9e-4d59-8615-230aceafd7a3/log/ODSIngestion.status
sudo chmod 750 /home/nxautomation || true


#  Omit the domain suffix for the user with RHEL8:  https://access.redhat.com/solutions/5592351
#echo 'Oph0Du4On7Haf9Ve1Jo6Ry0' | realm leave --remove --user=svc_adjoin css.cgipdc.cginet
echo 0

rm -rf /home/cgiadmin/ansible-role-rhel8-cis || true
rm -rf /opt/RHEL8-CIS-Audit || true