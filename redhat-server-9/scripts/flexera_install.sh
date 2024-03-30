mv /tmp/flexera /home/cgiadmin/flexera 
cd flexera || exit
pwd
ls -lsa
which python3
python3 --version
alternatives  --list  | grep python
python3 /usr/local/bin/ansible-playbook playbooks/flexera_install-linux.yml -i inventory/iac_localrun --connection=local