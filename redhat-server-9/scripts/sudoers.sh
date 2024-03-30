#!/bin/bash

### setup /etc/sudoers.d  ###
echo '> setup /etc/sudoers.d  ...'
#activate sudoers.d
sudo sed -i '/includedir/s/^#//' /etc/sudoers

