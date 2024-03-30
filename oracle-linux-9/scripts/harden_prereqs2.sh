#!/bin/bash

source /usr/local/bin/mipc/exportproxies.sh
#python3 -m pip install pip==21.3.1
# pip install --user pip --upgrade
pip install -U Jinja2
pip install -U ansible
pip install -U selinux
pip install -U passlib
pip install -U lxml
pip install -U xmltodict
pip install -U jmespath
pip install -U yamllint
pip install -U simplejson
pip install -U jsonschema 
unset {http,https,ftp}_proxy

sudo dnf install -y python3-pyyaml python3-libxml2 python3-pycparser sshpass

