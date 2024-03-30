#!/bin/bash
export BUILD_USERNAME
export RHSM_USERNAME
export RHSM_PASSWORD
export VCENTER_ENVIRONMENT

source /usr/local/bin/mipc/exportproxies.sh

dnf -y install ca-certificates


### Copy the SSH key to authorized_keys and set permissions. ###
echo '> Copying the SSH key to Authorized Keys and setting permissions ...'
sudo mkdir -p /home/"$BUILD_USERNAME"/.ssh
sudo chmod 700 /home/"$BUILD_USERNAME"/.ssh
sudo cp /tmp/authorized_keys /home/"$BUILD_USERNAME"/.ssh/authorized_keys
sudo chmod 644 /home/"$BUILD_USERNAME"/.ssh/authorized_keys
sudo chown cgiadmin:cgiadmin -R /home/"$BUILD_USERNAME"

### Configure SSH for Public Key Authentication. ###
echo '> Configuring SSH for Public Key Authentication ...'
sudo sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
sudo sed -i "s/.*PubkeyAuthentication.*/PubkeyAuthentication yes/g" /etc/ssh/sshd_config

### Restart the SSH daemon. ###
echo '> Restarting the SSH daemon. ...'
sudo systemctl restart sshd --no-pager
