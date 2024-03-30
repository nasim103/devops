systemctl disable ctrl-alt-del.target
systemctl mask ctrl-alt-del.target
echo 'CtrlAltDelBurstAction=none' >> /etc/systemd/system.conf
