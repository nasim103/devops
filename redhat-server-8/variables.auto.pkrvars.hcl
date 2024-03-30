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
vm_guest_os_member          = "server-8-Golden" 
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
vm_template_folder          = "UnixIAC/VMTemplates"

# ISO Objects  https://www.packer.io/plugins/builders/vsphere/vsphere-iso#http-directory-configuration

iso_file     = "rhel-8.8-x86_64-dvd_247b63f2-f526-4bfc-b7ce-5fa6131be381.iso"
iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/0da0307b-9ed8-4c65-91a0-8acf43d5b69f/"
iso_checksum = "none"



# Scripts

shell_scripts = ["../../../scripts/linux/redhat-server-cleanup.sh"]
