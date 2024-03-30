#!/bin/bash

export BUILD_USERNAME
export RHSM_USERNAME
export RHSM_PASSWORD
export VCENTER_ENVIRONMENT

# purge files to make sure since we are going to recreate them
rm /etc/rhsm/facts/katello.facts || true
rm /etc/yum.repos.d/docker.repo || true
rm /etc/environment || true
rm /etc/systemd/system/docker.service.d/https-proxy.conf || true
rm /etc/profile.d/proxy.sh || true

yum -y install vim nano net-tools bind-utils
yum -y update

yum clean packages
yum clean metadata
yum clean all

systemctl daemon-reload --no-pager
service docker restart
#systemctl enable docker

subscription-manager unregister

docker run hello-world
docker rm $(docker ps -a -f status=exited -f status=created -q)
docker rmi $(docker images -a -q)

# Reset the machine-id value. This has known to cause issues with DHCP
#
echo -n > /etc/machine-id

# Reset any existing cloud-init state
#
cloud-init clean -s -l
