#!/bin/bash
cd gto-security-engineering || exit
pwd
ls -lsa
which python3
python3 --version
alternatives  --list  | grep python
python3 /usr/local/bin/ansible-playbook playbooks/linux-install-ama.yml -i inventory/iac_localrun '--ssh-common-args=-o StrictHostKeyChecking=no' --connection=local