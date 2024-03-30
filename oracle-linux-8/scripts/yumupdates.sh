# Final update

#  This package is needed for using dnf to remove old kernels
#sudo dnf install dnf-plugins-core

echo "Performing yum update and clean*******************************************"

 source /usr/local/bin/mipc/exportproxies.sh

dnf -y update --nobest
dnf -y clean all

hostnamectl || true