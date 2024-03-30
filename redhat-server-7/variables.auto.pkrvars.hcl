# 
# Packer variables for Red Hat Enterprise Linux 8 Server.

##################################################################################
# VARIABLES
##################################################################################

# HTTP Kickstart Settings 

#http_directory = "../../../configs/linux/redhat-server"
http_directory = "configs"
http_file      = "ks-rhel7.cfg"

# Virtual Machine Settings

vm_guest_os_family          = "PHX" 
vm_guest_os_vendor          = "RHEL"
vm_guest_os_member          = "7" 
vm_guest_os_version         = "DEVELOP"
vm_guest_os_type            = "rhel7_64Guest" 
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

#iso_file     = "rhel-server-7.9-x86_64-dvd.iso"
iso_checksum = "none"
iso_file     = "rhel-server-7.9-x86_64-dvd_328f6a13-c0d4-40df-829d-9ef6f474b1b6.iso"
iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/7a214896-d67e-45e5-b77e-6b00cdb87151/"


# Scripts

shell_scripts = ["../../../scripts/linux/redhat-server-cleanup.sh"]
