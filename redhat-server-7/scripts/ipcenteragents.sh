echo "Installing IPCenter Agents"

cd /tmp || exit 1

# yum -y localinstall -y IPsoft-perl-5.14.2-2.el7.x86_64.rpm
# yum -y localinstall -y IPsoft-perl-modules-2.8-1.el7.x86_64.rpm
# yum -y localinstall -y IPsoft-IPremote-5.5.2-1.el7.noarch.rpm

yum -y localinstall -y IPsoft-perl-5.30.0-1.el8.x86_64.rpm
yum -y localinstall -y IPsoft-perl-modules-4.0-1.el8.x86_64.rpm
yum -y localinstall -y IPsoft-IPremote-5.8.0-2.el8.noarch.rpm