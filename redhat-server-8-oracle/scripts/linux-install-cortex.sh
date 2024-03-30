#!/bin/bash
cd gto-security-engineering || exit
pwd
ls -lsa
which python3
python3 --version
alternatives  --list  | grep python
#python3 /usr/local/bin/ansible-playbook playbooks/linux-install-cortex.yml  -i inventory/iac_localrun --extra-vars "proxy_ip=10.160.2.6:8080" --ssh-common-args='-o StrictHostKeyChecking=no' --connection=local
python3 /usr/local/bin/ansible-playbook playbooks/linux-install-cortex.yml --extra-vars "proxy_ip=10.160.2.6:8080" --ssh-common-args='-o StrictHostKeyChecking=no' --connection=local