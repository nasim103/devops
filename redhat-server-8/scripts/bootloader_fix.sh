sudo dnf install grub2-efi-x64-modules -y
sudo dnf reinstall shim-* grub2-efi-* -y
sudo grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg