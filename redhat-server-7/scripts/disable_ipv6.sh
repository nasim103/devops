touch /etc/sysctl.d/70-ipv6.conf
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.d/70-ipv6.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/70-ipv6.conf
sysctl --load /etc/sysctl.d/70-ipv6.conf
