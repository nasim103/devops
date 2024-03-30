##################################################################################
# VARIABLES
##################################################################################

##################################################################################
# How many vms are we building today? #
##################################################################################

vm-count = 2


##################################################################################
# Vcenter notes section
##################################################################################
vm_annotation                    = "Deployed via Terraform with love"

##################################################################################
# Credentials
##################################################################################

vsphere_server   = "phx-ctss-vcsa01.css.cgipdc.cginet"
vsphere_username = "svc_unixiac@CSS.CGIPDC.CGINET"
vsphere_password = "P@ssw0rd12345@@"
vsphere_insecure = true

##################################################################################
# vSphere Settings
##################################################################################

vsphere_datacenter = "PHX-CTSS"
vsphere_cluster    = "INT-LINUX"
vsphere_datastore  = "CGI-GTO-CTSS-CL0XE-08B9"
vsphere_folder     = "UnixIAC/VMTemplates/"
vsphere_network    = "1495-Backup-Actifio"
vsphere_template   = "linux-redhat-server-8-golden"

##################################################################################
# Virtual Machines Settings
##################################################################################

vm_name                    = "rhel8-terra"
vm_cpus                    = 2
vm_memory                  = 8192
vm_firmware                = "efi"
vm_efi_secure_boot_enabled = true
vm_hostname                = "rhel8-terra"
vm_domain                  = "css.cgipdc.cginet"
vm_ipv4_address            = "10.106.68."
vm_ipv4_netmask            = "24"
vm_ipv4_gateway            = "10.106.68.1"
vm_dns_suffix_list         = ["css.cgipdc.cginet"]
vm_dns_server_list         = ["10.0.3.72 ","10.0.3.71",]
