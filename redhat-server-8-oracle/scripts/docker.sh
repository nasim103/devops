#/bin/bash
export BUILD_USERNAME
export RHSM_USERNAME
export RHSM_PASSWORD
export VCENTER_ENVIRONMENT

#source /usr/local/bin/mipc/exportproxies.sh

cd /usr/tmp
#pre-requisites for container-selinux:
dnf -y install libselinux-utils policycoreutils policycoreutils-python-utils sed selinux-policy selinux-policy-base selinux-policy-targeted
# pre-requisites for docker on RHEL
dnf -y install device-mapper libseccomp libtool-ltdl libcgroup iptables

#dnf -y install /tmp/docker-ce/*.rpm

#source /usr/local/bin/mipc/exportproxies.sh
# dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
#dnf install --nobest docker-ce
wget -q https://download.docker.com/linux/centos/8/x86_64/stable/Packages/containerd.io-1.6.9-3.1.el8.x86_64.rpm
dnf -y install ./containerd.io-1.6.9-3.1.el8.x86_64.rpm
dnf -y install docker-ce

[ $(getent group docker) ] || groupadd docker
sudo usermod -aG docker "$BUILD_USERNAME"
#sudo usermod -aG docker rancher || true

systemctl daemon-reload --no-pager
systemctl restart docker --no-pager

#Enable to start at boot
systemctl enable --now docker.service --no-pager
systemctl enable --now containerd.service --no-pager

#Enable our insecure registry
#   Need to add certs to the trusted root certs and to /etc/docker/certs.d/ourregistry.com:5000/
#   https://docs.docker.com/registry/insecure/

##  Also add the certs in the /etc/docker/certs.d/[harbor url]\:443 folders.  The certs.sh script adds these certs to the "trusted root certificates" store as well.

# #SDLC Feature harbor instance
sudo mkdir -p /etc/docker/certs.d/psdlce-harb-f.shr.dev.mipc.css.cgipdc.cginet\:443
sudo cp /tmp/ga_issuing.cer /etc/docker/certs.d/psdlce-harb-f.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root.cer /etc/docker/certs.d/psdlce-harb-f.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_issuing_2023.cer /etc/docker/certs.d/psdlce-harb-f.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root_2023.cer /etc/docker/certs.d/psdlce-harb-f.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo chmod 644 /etc/docker/certs.d/psdlce-harb-f.shr.dev.mipc.css.cgipdc.cginet\:443/*.cer

# #SDLC Stable harbor instance
sudo mkdir -p /etc/docker/certs.d/psdlce-harb-s.shr.dev.mipc.css.cgipdc.cginet\:443
sudo cp /tmp/ga_issuing.cer /etc/docker/certs.d/psdlce-harb-s.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root.cer /etc/docker/certs.d/psdlce-harb-s.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_issuing_2023.cer /etc/docker/certs.d/psdlce-harb-s.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root_2023.cer /etc/docker/certs.d/psdlce-harb-s.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo chmod 644 /etc/docker/certs.d/psdlce-harb-s.shr.dev.mipc.css.cgipdc.cginet\:443/*.cer

#  #SDLC NonProd harbor instance  psdlce-harb-n
sudo mkdir -p /etc/docker/certs.d/psdlce-harb-n.shr.dev.mipc.css.cgipdc.cginet\:443
sudo cp /tmp/ga_issuing.cer /etc/docker/certs.d/psdlce-harb-n.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root.cer /etc/docker/certs.d/psdlce-harb-n.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_issuing_2023.cer /etc/docker/certs.d/psdlce-harb-n.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root_2023.cer /etc/docker/certs.d/psdlce-harb-n.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo chmod 644 /etc/docker/certs.d/psdlce-harb-n.shr.dev.mipc.css.cgipdc.cginet\:443/*.cer
#  #SDLC Prod harbor instance  psdlce-harb-p
sudo mkdir -p /etc/docker/certs.d/psdlce-harb-p.shr.dev.mipc.css.cgipdc.cginet\:443
sudo cp /tmp/ga_issuing.cer /etc/docker/certs.d/psdlce-harb-p.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root.cer /etc/docker/certs.d/psdlce-harb-p.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_issuing_2023.cer /etc/docker/certs.d/psdlce-harb-p.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root_2023.cer /etc/docker/certs.d/psdlce-harb-p.shr.dev.mipc.css.cgipdc.cginet\:443/
sudo chmod 644 /etc/docker/certs.d/psdlce-harb-p.shr.dev.mipc.css.cgipdc.cginet\:443/*.cer

# #ACDCS npd harbor instance
sudo mkdir -p /etc/docker/certs.d/achsc-i123-n.css.cgipdc.cginet\:443
sudo cp /tmp/ga_issuing.cer /etc/docker/certs.d/achsc-i123-n.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root.cer /etc/docker/certs.d/achsc-i123-n.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_issuing_2023.cer /etc/docker/certs.d/achsc-i123-n.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root_2023.cer /etc/docker/certs.d/achsc-i123-n.css.cgipdc.cginet\:443/
sudo chmod 644 /etc/docker/certs.d/achsc-i123-n.css.cgipdc.cginet\:443/*.cer

# #ACDCS PROD harbor instance
sudo mkdir -p /etc/docker/certs.d/achsc-i323-p.css.cgipdc.cginet\:443
sudo cp /tmp/ga_issuing.cer /etc/docker/certs.d/achsc-i323-p.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root.cer /etc/docker/certs.d/achsc-i323-p.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_issuing_2023.cer /etc/docker/certs.d/achsc-i323-p.css.cgipdc.cginet\:443/
sudo cp /tmp/ga_root_2023.cer /etc/docker/certs.d/achsc-i323-p.css.cgipdc.cginet\:443/
sudo chmod 644 /etc/docker/certs.d/achsc-i323-p.css.cgipdc.cginet\:443/*.cer

systemctl restart docker --no-pager

#### Configure proxy settings as appropriate. ###
if [ "$VCENTER_ENVIRONMENT" == "local" ]
then
    echo "Not setting a docker proxy for the VCENTER_ENVIRONMENT=$VCENTER_ENVIRONMENT"
else
  #Allow Docker Images from Docker.io
  # https://www.thegeekdiary.com/how-to-configure-docker-to-use-proxy/
  if [ ! -d "/etc/systemd/system/docker.service.d" ]; then
    mkdir /etc/systemd/system/docker.service.d
    cat << EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
    [Service]
    Environment="HTTP_PROXY=http://10.160.2.6:8080/"
    Environment="HTTPS_PROXY=http://10.160.2.6:8080/"
    Environment="NO_PROXY=localhost,127.0.0.1,.css.cgipdc.cginet,.intmgmt.com,10.0.0.0/8,162.0.0.0/8"
EOF
  fi
fi
# Start the firewal before adding rules:  It is turned off again below.
#dnf -y install firewalld
sudo systemctl start firewalld --no-pager

echo "***********allowing traffic on port 1023 for IPremote***********************************************************************************"
sudo firewall-cmd --permanent --add-port=1023/tcp

# sudo systemctl enable firewalld
firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=6443/tcp --permanent
firewall-cmd --zone=public --add-port=2379/tcp --permanent
firewall-cmd --zone=public --add-port=2380/tcp --permanent
firewall-cmd --zone=public --add-port=8472/udp --permanent
firewall-cmd --zone=public --add-port=4789/udp --permanent
firewall-cmd --zone=public --add-port=10250/tcp --permanent
#9099 and 10254 are traffic to itself, so shouldn't need to open any external firewalls
firewall-cmd --zone=public --add-port=9099/tcp --permanent
firewall-cmd --zone=public --add-port=10254/tcp --permanent
#Only if ranges don't work out...
# firewall-cmd --zone=public --add-port=31441/tcp --permanent
# firewall-cmd --zone=public --add-port=30869/tcp --permanent
# firewall-cmd --zone=public --add-port=31441/udp --permanent
# firewall-cmd --zone=public --add-port=30869/udp --permanent
firewall-cmd --zone=public --add-port=30000-32767/udp --permanent
firewall-cmd --zone=public --add-port=30000-32767/tcp --permanent

#Flannel specific
firewall-cmd --zone=public --add-port=8285/udp --permanent
#RHEL8 specific  https://rancher.com/docs/rke/latest/en/os/#red-hat-enterprise-linux-rhel--oracle-linux-ol--centos
firewall-cmd --zone=public  --add-masquerade --permanent

#We need to disable the firewall completely for K8s 1.19
#1)
service firewalld stop
systemctl disable firewalld --no-pager
# Turn off SELINUX
# setenforece 0 will return an error if it is already disabled.
setenforce 0 || true
systemctl daemon-reload --no-pager
systemctl restart docker --no-pager
