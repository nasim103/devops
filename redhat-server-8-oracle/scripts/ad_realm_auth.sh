
#for later:
#cd cis-gto-rhel || exit
#which python3
#python3 --version
#alternatives  --list  | grep python
#python3 /usr/local/bin/ansible-playbook non_realm_auth.yml -i inventory/iac_localrun


###################################################

### Add VM to CTSS Domain  ###
echo '> Add VM to CTSS Domain ...'

#  If encryption issues arise:  sudo update-crypto-policies --set DEFAULT:AD-SUPPORT
#  Omit the domain suffix for the user with RHEL8:  https://access.redhat.com/solutions/5592351
echo 'Oph0Du4On7Haf9Ve1Jo6Ry0' | realm leave --remove --user=svc_adjoin css.cgipdc.cginet || true
echo 'Oph0Du4On7Haf9Ve1Jo6Ry0' | realm join --user=svc_adjoin --computer-ou="OU=IaC,OU=Unix,OU=Tier 1,OU=Staff,OU=MGMT,DC=css,DC=cgipdc,DC=cginet" css.cgipdc.cginet || true

### Restart sssd services  ###
echo '> Restart sssd services ...'
sudo systemctl restart sssd

### Test AD auth out & fatal error if fail  ###
echo '> Test AD auth out & fatal error if fail ...'

id rgouge@CSS.CGIPDC.CGINET || true

### Test AD auth out & fatal error if fail  ###
echo '> Test AD auth out & fatal error if fail ...'

### Add CSS-Unix Group to allow the team to login  ###
echo '> Add CSS-Unix Group to allow the team to login ...'
realm permit -g CSS-Unix@CSS.CGIPDC.CGINET
realm permit svc_sailpoint@CSS.CGIPDC.CGINET
realm permit svc_unixiac@CSS.CGIPDC.CGINET
realm permit svc_rapid7@CSS.CGIPDC.CGINET
realm permit svc_forescout@CSS.CGIPDC.CGINET
realm permit svc_rundeck@CSS.CGIPDC.CGINET   #Rajesh Saka



#realm deny --all
#realm permit --all

