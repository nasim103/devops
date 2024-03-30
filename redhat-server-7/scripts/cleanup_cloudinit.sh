#!/bin/bash
# Final update

#  This package is needed for using yum to remove old kernels
#sudo yum install yum-plugins-core

echo "Cleaning up old kernels *******************************************"
#yum remove $(yum repoquery --installonly --latest-limit=-2 -q)
sudo package-cleanup --oldkernels --count=2 -y

# Unregister from the satelite server
echo "Disconnecting this machine from the satellite servers."
sudo subscription-manager remove --all
sudo subscription-manager unregister
sudo subscription-manager clean

sudo rm -rf /var/cache/yum || true
sudo rm -rf /var/cache/yum || true

## Clean logs
echo "Cleaning up logs *******************************************"
truncate -s 0 /var/log/*.* || true
truncate -s 0 /var/log/**/*.* || true
find /var/log -type f -name '*.[0-99].gz' -exec rm {} +  || true
rm -rfv /var/log/anaconda/*  || true

# Cleans persistent udev rules.
echo '> Cleaning persistent udev rules ...'
if [ -f /etc/udev/rules.d/70-persistent-net.rules ]; then
    rm /etc/udev/rules.d/70-persistent-net.rules  || true
fi

# Cleans /tmp directories.
echo '> Cleaning /tmp directories ...'
rm -rf /tmp/* || true
rm -rf /var/tmp/* || true
rm -rf /var/log/rhsm/* || true
rm -rf /var/cache/yum/* || true
rm -rf /var/cache/yum/* || true

# Sets hostname to localhost.
echo '> Setting hostname to localhost ...'
cat /dev/null > /etc/hostname
hostnamectl set-hostname localhost

# Reset the machine-id value. This has known to cause issues with DHCP
# Cleans the machine-id.
echo '> Cleaning the machine-id ...'
if [ -f /etc/machine-id ]; then
    truncate -s 0 /etc/machine-id || true
fi
if [ -f /var/lib/dbus/machine-id ]; then
    rm /var/lib/dbus/machine-id || true
fi
ln -s /etc/machine-id /var/lib/dbus/machine-id || true

# Cleans shell history.
echo '> Cleaning shell history ...'
unset HISTFILE
history -cw
echo > ~/.bash_history || true
rm -fr /root/.bash_history || true

# Run a sync for giggles. And then again.
sync && sync

# Reset any existing cloud-init state
#
cloud-init clean -s -l  || true

echo "Enabling cloud-init networking"
if [ -f /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg ]; then
    rm -rf /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg || true
fi