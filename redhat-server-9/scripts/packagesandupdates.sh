#!/bin/bash

 #source /usr/local/bin/mipc/exportproxies.sh

STAMP_FILE="/etc/packerinfo"

# generic - basic repositories and basic stuff
echo "Provisioning phase 1 - Starting: EPEL, SELinux and basic packages"
if [ -d /etc/pki/rpm-gpg ]; then
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*
fi

echo "Installing Packages"
#dnf -y install /tmp/epel-release-latest-8.noarch.rpm

sudo dnf -y install python3-policycoreutils selinux-policy-devel openldap-clients sssd sssd-ldap authconfig  sssd-ad nfs-utils # pam_ldap not in 9
sudo dnf -y install realmd adcli sssd oddjob oddjob-mkhomedir samba-common-tools krb5-workstation authselect-compat
# The following are needed for the next version of IPCenter
#yum -y -e 0 install nagios-common-4.3.4-5.el7.x86_64 nagios-plugins-2.3.3-2.el7.x86_64 nagios-plugins-disk-2.3.3-2.el7.x86_64 nagios-plugins-uptime-2.3.3-2.el7.x86_64 nagios-plugins-load-2.3.3-2.el7.x86_64 nagios-plugins-procs-2.3.3-2.el7.x86_64 nagios-plugins-swap-2.3.3-2.el7.x86_64 postgresql-libs-9.2.24-1.el7_5.x86_64 unixODBC-2.3.1-11.el7.x86_64
echo "Provisioning phase 2 - Extra Packages"
sudo dnf -y install perl open-vm-tools openssh chrony  # system-storage-manager not in 9

#packages needed for Ansible
sudo dnf -y install git
sudo dnf -y install python3-pip # python39 Probably do not need Python 3.9
#packaged needed for CIS hardening playbook
sudo dnf -y install dconf audit cronie authconfig aide
#dnf -y remove ansible
#dnf -y install ansible

dnf -y install sysstat
systemctl start sysstat.service
systemctl enable sysstat.service

dnf -y install nmon
dnf -y install bind-utils

#alternatives --set python /usr/bin/python3.6
#alternatives --set python /usr/bin/python3.9

# source /usr/local/bin/mipc/exportproxies.sh
# Mostly adding this so I don't forget
# python3 -m pip install -q --upgrade pip kubernetes


#yum-config-manager -y -q -e 0 --enable epel --setopt="epel.priority=90"|grep -i "enabled ="

# # disable selinux
# echo "********************* Disabling SELinux"
# sed -i /etc/sysconfig/selinux -r -e 's/^SELINUX=.*/SELINUX=disabled/g'
# sed -i /etc/selinux/config -r -e 's/^SELINUX=.*/SELINUX=disabled/g'

# systemd - enable and disable services
echo "Provisioning phase 3 - Services"
#systemctl enable firewalld --no-pager
systemctl enable chronyd --no-pager
systemctl restart chronyd
chronyc sources
#systemctl enable ntpd --no-pager
systemctl enable sshd --no-pager
systemctl set-default multi-user.target --no-pager
echo "Provisioning phase 3 - Services done"


cat /etc/redhat-release
# Create STAMP_FILE
if [ -e $STAMP_FILE ]; then
  rm -rfv $STAMP_FILE
  touch $STAMP_FILE
fi
echo "creationDate: $(date +%Y-%m-%d_%H:%M)" >>$STAMP_FILE
echo "Finished installing packages"
echo "Contents of /etc/ssh/sshd_config"
cat /etc/ssh/sshd_config || true
