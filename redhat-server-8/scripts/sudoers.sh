#!/bin/bash

### setup /etc/sudoers.d  ###
echo '> setup /etc/sudoers.d  ...'
#activate sudoers.d
sed -i '/includedir/s/^#//' /etc/sudoers

