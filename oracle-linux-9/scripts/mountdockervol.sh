#!/bin/bash
chmod +x /tmp/mkfs_device.sh
/tmp/mkfs_device.sh /dev/sdb
mkdir -p /var/lib/docker
docker=`blkid |grep /dev/sdb1| awk '{print $2}'`;echo $docker' /var/lib/docker             ext4    defaults        1 1' >>/etc/fstab
mount -a
df -h