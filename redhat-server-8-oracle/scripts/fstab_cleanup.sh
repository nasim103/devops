sudo sed -i 's;/boot/efi vfat defaults,umask=0027,fmask=0077,uid=0,gid=0 0 0;/boot/efi vfat defaults,umask=0027,nodev,fmask=0077,uid=0,gid=0 0 0;g' /etc/fstab
sudo systemctl daemon-reload
mount -o remount /boot/efi