sudo sed -i 's/server 10.0.3.72  minpoll 8/server 10.0.3.72  iburst/g' /etc/chrony.conf || true
sudo sed -i 's/server 10.0.3.71 minpoll 8/server 10.0.3.71 iburst/g' /etc/chrony.conf || true