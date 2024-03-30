# 
# Packer variables for Debian 12.1.

##################################################################################
# VARIABLES
##################################################################################

# HTTP Kickstart Settings

http_directory = "../../../configs/linux/debian-server"

# Virtual Machine Settings

vm_guest_os_family          = "PHX" 
vm_guest_os_vendor          = "DEB"
vm_guest_os_member          = "12-1" 
vm_guest_os_version         = "DEVELOP"
# vm_guest_os_type            = "debian11_64Guest"  debian terraform customization not supported
vm_guest_os_type            = "ubuntu64Guest" 
vm_version                  = 19
vm_firmware                 = "efi-secure"
vm_cdrom_type               = "sata"
vm_cpu_sockets              = 2
vm_cpu_cores                = 2
vm_mem_size                 = 8192
vm_disk_size                = 40960 #ignore me
vm_bootdisk_size            = 102400
# vm_datadisk_size            = 100000
vm_disk_controller_type     = ["pvscsi"]
vm_network_card             = "vmxnet3"
vm_boot_wait                = "20s"
vm_template_folder          = "UnixIAC/VMTemplates"

# ISO Objects

#iso_file     = "debian-12.1.0-amd64-DVD-1.iso"
#iso_checksum = "302c990c6d69575ff24c96566e5c7e26bf36908abb0cd546e22687c46fb07bf8dba595bf77a9d4fd9ab63e75c0437c133f35462fd41ea77f6f616140cd0e5e6a"
iso_file     = "debian-12.1.0-amd64-DVD-1_52296e47-ed7f-4132-9aa4-992b07b1f383.iso"
iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/5f5f063d-cb80-4b83-9751-f1d9a9920af7/"

# Scripts

# shell_scripts = ["../../../scripts/linux/ubuntu-server-cleanup.sh"]