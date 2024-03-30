# 
# Packer variables for Red Hat Enterprise Linux 8 Server.

##################################################################################
# VARIABLES
##################################################################################

# HTTP Kickstart Settings 

#http_directory = "../../../configs/linux/redhat-server"
http_directory = "configs"
http_file      = "ks-rhel8.cfg"

# Virtual Machine Settings

vm_guest_os_family          = "linux" 
vm_guest_os_vendor          = "redhat"
vm_guest_os_member          = "server" 
vm_guest_os_version         = "8"
vm_guest_os_type            = "rhel8_64Guest" 
vm_version                  = 14
vm_firmware                 = "efi"
vm_cdrom_type               = "sata"
vm_cpu_sockets              = 2
vm_cpu_cores                = 2
vm_mem_size                 = 8192
vm_disk_size                = 40960 #ignore me
vm_bootdisk_size            = 102400
# vm_datadisk_size            = 100000
vm_disk_controller_type     = "pvscsi"
vm_network_card             = "vmxnet3"
vm_boot_wait                = "20s"
vm_template_folder          = "InfraAsCode/VMTemplates/Rancher"

# ISO Objects  https://www.packer.io/plugins/builders/vsphere/vsphere-iso#http-directory-configuration

iso_file     = "rhel-8.8-x86_64-dvd.iso"
iso_checksum = "none"



# Scripts

shell_scripts = ["../../../scripts/linux/redhat-server-cleanup.sh"]
