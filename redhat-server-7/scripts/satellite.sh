#/bin/bash

pwd

# Copy the rhsm.conf file with the correct proxy values.
echo "Copying rhsm.conf file with correct proxy settings for satellite"
sudo cp /tmp/rhsm.conf /etc/rhsm/rhsm.conf
sudo cp /tmp/neosat.conf /etc/neosat.conf

rpm -e katello-ca-consumer-phx-mgt-lpsat3.intmgmt.com-1.0-8.noarch || true
rpm -e katello-ca-consumer-phx-mgt-lpsat1.intmgmt.com-1.0-1.noarch || true
echo "Retrieving katello satellite rpm"
#wget -e use_proxy=yes -e https_proxy=10.0.3.68:443 --no-check-certificate https://phx-mgt-lpsat3.intmgmt.com/pub/katello-ca-consumer-latest.noarch.rpm
wget -e use_proxy=yes -e https_proxy=10.0.3.68:443 --no-check-certificate https://phx-mgt-lpsat1.intmgmt.com/pub/katello-ca-consumer-latest.noarch.rpm
echo "Installing katello"
sudo rpm -i ./katello-ca-consumer-latest.noarch.rpm
echo "Registering with satellite server"
# sudo subscription-manager register --org="PDC" --activationkey="mipc-nprd-rhel8" || true
sudo subscription-manager register --org="PDC" --activationkey="weekly-nprd-rhel7" || true
sleep 5
echo "Calling subscription-manager attach --auto"
sudo subscription-manager attach --auto  || true
sleep 5
echo "Enabling standard repos"
sudo subscription-manager repos --list

#sudo subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
#sudo subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
#sudo subscription-manager repos --disable=PDC_postgresql14_postgresql14-rhel8
#sudo subscription-manager repos --enable=PDC_EPEL7_EPEL7_X86_64
#sudo subscription-manager repos --enable=satellite-tools-6.8-for-rhel-8-x86_64-rpms
#sudo subscription-manager repos --enable=satellite-tools-6.7-for-rhel-8-x86_64-rpms


#sudo yum clean all
#sudo yum update -y

echo "Finished adding repos"
yum repolist all
