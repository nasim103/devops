# 
# Packer variables for Oracle Linux 8 Server.

##################################################################################
# VARIABLES
##################################################################################

# HTTP Kickstart Settings 

#http_directory = "../../../configs/linux/redhat-server"
http_directory = "configs"
http_file      = "ks-oel8.cfg"

# Virtual Machine Settings

vm_guest_os_family          = "PHX" 
vm_guest_os_vendor          = "ORACLE"
vm_guest_os_member          = "8" 
vm_guest_os_version         = "DEVELOP"
vm_guest_os_type            = "oracleLinux8_64Guest" 
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

#iso_file     = "OracleLinux-R8-U8-x86_64-dvd.iso"
iso_checksum = "none"
iso_file     = "OracleLinux-R8-U8-x86_64-dvd_353b4c4b-7828-4960-9dfb-162704bb72b3.iso"
iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/3ad5f429-23de-4386-a802-deba650c49a6/"


# Scripts

shell_scripts = ["../../../scripts/linux/redhat-server-cleanup.sh"]
