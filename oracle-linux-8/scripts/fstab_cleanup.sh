# sed -i '/1AC3-13DF/d' /etc/fstab
# sed -i '/5e7a8502-0315-4176-b70f-90cbef8cbb6f/d' /etc/fstab
#echo 'UUID=1AC3-13DF          /boot/efi               vfat    defaults,nodev,uid=0,gid=0,umask=077,shortname=winnt 0 2' >> /etc/fstab

systemctl daemon-reload
mount -o remount /boot/efi





