### Set selinux to permissive   ###
echo '> Set selinux to permissive ...'

sudo rm -rf /etc/selinux/config
sudo cp /tmp/config /etc/selinux
sudo grubby --update-kernel ALL --remove-args selinux