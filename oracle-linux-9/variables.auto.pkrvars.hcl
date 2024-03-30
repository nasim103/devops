# 
# Packer variables for Oracle Linux 9 Server.

##################################################################################
# VARIABLES
##################################################################################

# HTTP Kickstart Settings 

#http_directory = "../../../configs/linux/redhat-server"
http_directory = "configs"
http_file      = "ks-oel9.cfg"

# Virtual Machine Settings

vm_guest_os_family          = "PHX" 
vm_guest_os_vendor          = "ORACLE"
vm_guest_os_member          = "9" 
vm_guest_os_version         = "DEVELOP"
vm_guest_os_type            = "oracleLinux9_64Guest" 
vm_version                  = 19
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
vm_template_folder          = "UnixIAC/VMTemplates"

# ISO Objects  https://www.packer.io/plugins/builders/vsphere/vsphere-iso#http-directory-configuration

#iso_file     = "OracleLinux-R9-U2-x86_64-dvd.iso"
iso_checksum = "none"
iso_file     = "OracleLinux-R9-U2-x86_64-dvd_747d9c8c-bac9-42ed-ad0d-5b7a81a4cfe2.iso"
iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/bb514414-38d3-4a5f-a4f0-c5fe6beaf3ec/"


# Scripts

shell_scripts = ["../../../scripts/linux/redhat-server-cleanup.sh"]
