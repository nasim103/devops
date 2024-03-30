sudo sed -i 's/server 10.0.3.124 minpoll 8/server 10.0.3.124 iburst/g' /etc/chrony.conf || true
sudo sed -i 's/server 10.0.3.125 minpoll 8/server 10.0.3.125 iburst/g' /etc/chrony.conf || true