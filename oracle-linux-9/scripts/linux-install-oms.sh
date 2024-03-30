#!/bin/bash
pwd
ls -lsa
#which python3
#python3 --version
#alternatives  --list  | grep python
unzip /tmp/OMS-Agent-for-Linux-OMSAgent_v1.14.9-0.zip
sleep 30
source /usr/local/bin/mipc/exportproxies.sh
chmod +x /home/cgiadmin/OMS-Agent-for-Linux-OMSAgent_v1.14.9-0/omsagent-1.14.9-0.universal.x64.sh
sh /home/cgiadmin/OMS-Agent-for-Linux-OMSAgent_v1.14.9-0/omsagent-1.14.9-0.universal.x64.sh  --install -w 4cc297cb-ce9e-4d59-8615-230aceafd7a3 -s SvQleYbRvX3uWJRWyAPy2m147K5pP+8HWR6TF9Q3EBflH/LKEZNVlbSyAyEc0VVGpVxG64FXG3+OaD4+47sLgw== -p http://user01:password@10.160.2.6:8080
chmod -R 750 /home/nxautomation/
#python3 /usr/local/bin/ansible-playbook playbooks/linux-install-oms2.yml -i inventory/iac_localrun --ssh-common-args='-o StrictHostKeyChecking=no' --connection=local