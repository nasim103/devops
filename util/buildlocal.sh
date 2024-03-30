#!/bin/bash

BASEDIR=$(pwd)

menu_option_1() {
  cd builds/linux/ubuntu-server-20-04-lts/
  echo -e "\nCONFIRM: Build a Ubuntu Server 20.04 LTS Template for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Ubuntu Sever 20.04 LTS Template for VMware vSphere ###
  echo "Building a Ubuntu Sever 20.04 LTS Template for VMware vSphere ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -force \
      -var-file="../../../vsphere.pkrvars.hcl" .
      
  ### All done. ###
  echo "Done."
}

menu_option_2() {
  cd builds/linux/ubuntu-server-18-04-lts/
  echo -e "\nCONFIRM: Build a Ubuntu Server 18.04 LTS Template for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build a Ubuntu Server 20.04 LTS Template for VMware vSphere ###
  echo "Building a Ubuntu Server 18.04 LTS Template for VMware vSphere ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -force \
      -var-file="../../../vsphere.pkrvars.hcl" .
      
  ### All done. ###
  echo "Done."
}

menu_option_3() {
  cd builds/linux/redhat-server-8/
  echo -e "\nCONFIRM: Build a Red Hat Enerprise Linux Server 8 Template for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build an Red Hat Enerprise Linux Server 8 Template for VMware vSphere ###
  echo "Building an Red Hat Enerprise Linux Server 8 Template for VMware vSphere ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -var-file="../../../vsphere.pkrvars.hcl" -var-file="variables.auto.pkrvars.hcl" "rhel-server-8.pkr.hcl"
  ### All done. ###

  ### All done. ###
  echo "Done."
}

menu_option_4() {
  cd builds/linux/rhel-server-79/
  echo -e "\nCONFIRM: Build a Red Hat Enerprise Linux Server 7 Template for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build an Red Hat Enerprise Linux Server 7 Template for VMware vSphere ###
  echo "Building an Red Hat Enerprise Linux Server 7 Template for VMware vSphere ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -color=false -var-file="../../../vsphere.pkrvars.hcl" -var-file="variables.auto.pkrvars.hcl" "rhel-server-79.pkr.hcl"
  ### All done. ###
  echo "Done."
}

menu_option_5() {
  cd builds/linux/rhel-server-79/
  echo -e "\nCONFIRM: Build a Red Hat Enerprise Linux Server 7 with CIS hardening Template for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build an Red Hat Enerprise Linux Server 7 Template for VMware vSphere ###
  echo "Building an Red Hat Enerprise Linux Server 7 with CIS hardening Template for VMware vSphere ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -color=false -var-file="../../../vsphere.pkrvars.hcl" -var-file="variables.auto.pkrvars.hcl" "rhel-server-79-hardened.pkr.hcl"
  ### All done. ###
  echo "Done."
}

menu_option_6() {
  cd builds/linux/rhel-server-79/
  echo -e "\nCONFIRM: Build a Red Hat Enerprise Linux Server 7 with CIS hardening and Docker-CE Template for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build an Red Hat Enerprise Linux Server 7 Template for VMware vSphere ###
  echo "Building an Red Hat Enerprise Linux Server 7 with CIS hardening Template for VMware vSphere ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -color=false -var-file="../../../vsphere.pkrvars.hcl" -var-file="variables.auto.pkrvars.hcl" "rhel-server-79-dockerce.pkr.hcl"
  ### All done. ###
  echo "Done."
}

menu_option_10() {
  cd builds/windows/windows-server-2019/
  echo -e "\nCONFIRM: Build Microsoft Windows Server 2019 Templates for VMware vSphere."
  echo -e "\nContinue? (y/n)"
  read REPLY
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    exit 1
  fi

  ### Build Microsoft Windows Server 2019 Standard Templates for VMware vSphere ###
  echo "Building Microsoft Windows Server 2019 Standard Templates for VMware vSphere  ..."
  rm -f output-vmware-iso/*.ova

  ### Apply the HashiCorp Packer Build ###
  echo "Applying the HashiCorp Packer Build ..."
  packer build -force \
      --only vsphere-iso.windows-server-standard-dexp,vsphere-iso.windows-server-standard-core \
      -var-file="../../../vsphere.pkrvars.hcl" .
      
  ### All done. ###
  echo "Done."
}

press_enter() {
  cd "$BASEDIR"
  echo -n "Press Enter to continue."
  read
  clear
}

info() {
  echo ""
  echo "Microsoft Windows Server builds include both Core and Desktop Experience."
  echo ""
  echo "UEFI based are not enabled by default for Microsoft Windows Server 2019/2016 and Red Hat Enterprise Linux 8 due to a known issue with cloning from the vSphere Content Library."
  echo ""
  read
}

incorrect_selection() {
  echo "Do or do not. There is no try."
}

until [ "$selection" = "0" ]; do
  clear
  echo ""
  echo -n "  Select a HashiCorp Packer build for VMware vSphere:"
  echo ""
  echo ""
  echo "      Linux Distribution:"
  echo ""
  echo "    	 1  -  Ubuntu Server 20.04 LTS"
  echo "    	 2  -  Ubuntu Server 18.04 LTS"
  echo "    	 3  -  Red Hat Enterprise Linux Server 8"
  echo "    	 4  -  Red Hat Enterprise Linux Server 7"
  echo "    	 5  -  Red Hat Enterprise Linux Server 7 - CIS Hardened"
  echo "    	 6  -  Red Hat Enterprise Linux Server 7 - CIS Hardened with Docker-CE"
  echo ""
  echo "      Microsoft Windows:"
  echo ""
  echo "    	10  -  Windows Server 2019 - Standard Only"
  echo ""
  echo ""
  echo "      Other:"
  echo ""
  echo "        I   -  Information"
  echo "        Q   -  Quit"
  echo ""
  read selection
  echo ""
  case $selection in
    1 ) clear ; menu_option_1 ; press_enter ;;
    2 ) clear ; menu_option_2 ; press_enter ;;
    3 ) clear ; menu_option_3 ; press_enter ;;
    4 ) clear ; menu_option_4 ; press_enter ;;
    5 ) clear ; menu_option_5 ; press_enter ;;    
    6 ) clear ; menu_option_6 ; press_enter ;;    
    10 ) clear ; menu_option_10 ; press_enter ;;
    I ) clear ; info ; press_enter ;;
    Q ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done