echo "Installing IPCenter Agents"

cd /tmp || exit 1
source /usr/local/bin/mipc/exportproxies.sh
sudo dnf -y install cyrus-sasl
sudo dnf -y cyrus-sasl-devel
sudo dnf -y localinstall -y gdbm-1.19-4.el9.x86_64.rpm || true
sudo dnf -y localinstall -y gdbm-devel-1.19-4.el9.x86_64.rpm || true
sudo dnf -y localinstall -y gdbm-libs-1.19-4.el9.x86_64.rpm || true
sudo dnf -y localinstall -y IPsoft-perl-5.30.0-1.el8.x86_64.rpm
sudo dnf -y localinstall -y IPsoft-perl-modules-4.0-1.el8.x86_64.rpm
sudo dnf -y localinstall -y IPsoft-IPremote-5.8.0-2.el8.noarch.rpm
sudo touch /apps/IPsoft/IPremote/etc/secret.cfg
sudo echo '# Shared secret definition - should be the same as the one contained in' >> /apps/IPsoft/IPremote/etc/secret.cfg
sudo echo '# check_IPremote.cfg' >> /apps/IPsoft/IPremote/etc/secret.cfg
sudo echo 'secret=ipmonytor1ng7642' >> /apps/IPsoft/IPremote/etc/secret.cfg
service ipremote restart
systemctl enable ipremote