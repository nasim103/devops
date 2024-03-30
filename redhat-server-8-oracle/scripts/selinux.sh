### Set selinux to permissive   ###
echo '> Set selinux to permissive ...'

rm -rf /etc/selinux/config
cp /tmp/config /etc/selinux