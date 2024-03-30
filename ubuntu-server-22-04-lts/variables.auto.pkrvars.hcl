# 
# Packer variables for Ubuntu Server 22.04 LTS.

##################################################################################
# VARIABLES
##################################################################################

# HTTP Kickstart Settings

http_directory = "../../../configs/linux/ubuntu-server"

# Virtual Machine Settings

vm_guest_os_family          = "PHX" 
vm_guest_os_vendor          = "UBUN"
vm_guest_os_member          = "22-04" 
vm_guest_os_version         = "DEVELOP"
vm_guest_os_type            = "ubuntu64Guest" 
vm_version                  = 14
vm_firmware                 = "efi"
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

#iso_file     = "iso-linux-ubuntu-server-22-04.iso"
#iso_checksum = "302c990c6d69575ff24c96566e5c7e26bf36908abb0cd546e22687c46fb07bf8dba595bf77a9d4fd9ab63e75c0437c133f35462fd41ea77f6f616140cd0e5e6a"
iso_file     = "iso-linux-ubuntu-server-22-04_11a1dee9-b292-4e75-85b6-aaf6954c191b.iso"
iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/f7b10884-5b2f-4d01-9ade-c125b5fccdbb/"

# Scripts

# shell_scripts = ["../../../scripts/linux/ubuntu-server-cleanup.sh"]