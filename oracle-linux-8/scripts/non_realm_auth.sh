#!/bin/bash
 
export GIT_SSL_NO_VERIFY=true

git clone --depth 1 -b main 
cd ad_realm_auth || exit

which python3
python3 --version
alternatives  --list  | grep python
python3 /usr/local/bin/ansible-playbook non_realm_auth.yml -i inventory/iac_localrun --ssh-common-args='-o StrictHostKeyChecking=no' --connection=local

echo 'minlen = 14' >> /etc/security/pwquality.conf
echo 'minclass = 4' >> /etc/security/pwquality.conf
echo 'deny = 5' >> /etc/security/faillock.conf
echo 'unlock_time = 900' >> /etc/security/faillock.conf

sed -i '/UMASK/d' /etc/login.defs
sed -i '/USERGROUPS_ENAB/d' /etc/login.defs
sed -i '/PASS_MIN_DAYS/d' /etc/login.defs
echo 'PASS_MIN_DAYS 7' >> /etc/login.defs
echo 'USERGROUPS_ENAB no' >> /etc/login.defs
echo 'UMASK 077' >> /etc/login.defs
authselect select custom/cis-profile with-faillock with-mkhomedir
systemctl enable --now oddjobd.service
systemctl start oddjobd.service
systemctl restart sssd.service
#echo 'session optional pam_umask.so' >> /etc/pam.d/password-auth
#echo 'session optional pam_umask.so' >> /etc/pam.d/system-auth
authselect apply-changes

cd ..
rm -rf /home/cgiadmin/cis-gto-rhel || true
