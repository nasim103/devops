#!/bin/bash

 source /usr/local/bin/mipc/exportproxies.sh

python3 -m pip install --user pip --upgrade
python3 -m pip install -U Jinja2
python3 -m pip install -U ansible
python3 -m pip install -U selinux
