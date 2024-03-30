sudo sed -i 's/server 172.22.4.124 minpoll 8/server 10.0.3.72  iburst/g' /etc/chrony.conf || true
sudo sed -i 's/server 172.22.4.125 minpoll 8/server 10.0.3.71 iburst/g' /etc/chrony.conf || true