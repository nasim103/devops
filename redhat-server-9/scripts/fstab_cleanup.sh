#echo 'UUID=1AC3-13DF          /boot/efi               vfat    defaults,nodev,uid=0,gid=0,umask=077,shortname=winnt 0 2' >> /etc/fstab

sudo sed -i 's;/boot/efi               vfat    defaults,uid=0,gid=0,umask=077,shortname=winnt;/boot/efi               vfat    defaults,nodev,uid=0,gid=0,umask=077,shortname=winnt;g' /etc/fstab
sudo sed -i 's;/var xfs defaults,nodev,nosuid;/var xfs defaults,nodev,noexec,nosuid ;g' /etc/fstab
systemctl daemon-reload
mount -o remount /boot/efi





