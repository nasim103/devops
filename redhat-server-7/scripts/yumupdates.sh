# Final update

#  This package is needed for using yum to remove old kernels
#sudo yum install yum-plugins-core

echo "Performing yum update and clean*******************************************"

# source /usr/local/bin/mipc/exportproxies.sh

yum -y update 
yum -y clean all

hostnamectl || true