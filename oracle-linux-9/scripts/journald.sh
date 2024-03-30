echo 'SystemMaxUse=2G' >> /etc/systemd/journald.conf 
echo 'Storage=persistent' >> /etc/systemd/journald.conf 
echo 'Compress=yes' >> /etc/systemd/journald.conf 
systemctl restart systemd-journald.service
