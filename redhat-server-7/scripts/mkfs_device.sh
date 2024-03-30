#!/bin/bash

contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

if [[ $# -eq 0 ]] ; then
    echo 'No parameters given, I need device and mountpoint'
    exit 1
else
    # main loop
    if [ -b "$1" ];then
       echo "$1 exists"
       device=$1
       outputstring="$(/usr/sbin/sfdisk -d $device 2>&1)"
       teststring="does not contain a recognized partition table"
       if [[ -z "$(/usr/sbin/sfdisk -d $device 2>&1)" ]] || [[ $outputstring == *$teststring* ]]; then
         echo "$device doesn't have partitions"
         /usr/sbin/parted --script "$device" \
         mklabel gpt \
         mkpart primary 2048s 100% \
         print devices
         # end of parted script
         part=$device'1'
         sleep 3
         echo "$part"
         /usr/sbin/partprobe -s "$device"
         sleep 2
         /usr/sbin/mkfs.ext4 "$part"
         /usr/sbin/tune2fs -m 1 "$part"
         echo "done paritioning"
       else
         echo "device does have existing partitions"
       fi
    else
       echo "$1 doesn't exists"
    fi
fi
