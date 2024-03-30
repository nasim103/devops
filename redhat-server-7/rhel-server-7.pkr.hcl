# 
# Packer template for Red Hat Enterprise Linux 7 Server.
# https://www.packer.io/docs/builders/vmware/vsphere-iso

##################################################################################
# VARIABLES
##################################################################################

# Credentials.

variable "vcenter_username" {
  type    = string
  description = "The username to login to the vCenter Server instance. (e.g. svc-packer-vsphere@vcenter7.io)"
  default = ""
  sensitive = true
}

variable "vcenter_password" {
  type      = string
  description = "The password for the login to the vCenter Server instance."
  default = ""
  sensitive = true
}

variable "build_username" {
  type    = string
  description = "The username to login to the guest operating system. (e.g. cgiadmin)"
  default = ""
  sensitive = true
}

variable "build_password" {
  type    = string
  description = "The password to login to the guest operating system."
  default = ""
  sensitive = true
}

variable "rhsm_username" {
  type    = string
  description = "The username to Red Hat Subscription Manager."
  default = ""
  sensitive = true
}

variable "rhsm_password" {
  type    = string
  description = "The password to login to Red Hat Subscription Manager."
  default = ""
  sensitive = true
}

# vSphere Objects

variable "vcenter_insecure_connection" {
  type    = bool
  description = "Do not validate vCenter Server TLS certificate."
  default = true
}

variable "vcenter_server" {
  type    = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance. (e.g. 'sfo-w01-vc01.sfo.example.io')"
  default = ""
}

variable "vcenter_datacenter" {
  type    = string
  description = "The name of the target vSphere datacenter. (e.g. 'sfo-w01-dc01')"
  default = ""
}

variable "vcenter_cluster" {
  type    = string
  description = "The name of the target vSphere cluster. (e.g. 'sfo-w01-cl01')"
  default = ""
}

variable "vcenter_datastore" {
  type    = string
  description = "The name of the target vSphere datastore. (e.g. 'sfo-w01-cl01-vsan01')"
  default = ""
}

variable "vcenter_network" {
  type    = string
  description = "The name of the target vSphere network segment. (e.g. 'sfo-w01-dhcp')"
  default = ""
}

variable "vcenter_folder" {
  type    = string
  description = "The name of the target vSphere cluster. (e.g. 'sfo-w01-fd-templates')"
  default = ""
}

variable "vcenter_content_library" {
  type    = string
  description = "The name of the target vSphere content library, if used. (e.g. 'sfo-w01-cl01-lib01')"
  default = ""
}

variable "vcenter_environment" {
  type    = string
  description = "The vcenter environment where this is being executed.  Currently used to determine if proxy settings should be applied"
  default = "local"
}

# variable "vcenter_resource_pool" {
#  type    = string
#  description = "vSphere resource pool. If not set, it will look for the root resource pool of the host or cluster If a root resource is not found it will then look for a default resource pool"
#  default = "youdidntchangeme"
# }
# ISO Objects

variable "iso_datastore" {
  type    = string
  description = "The name of the source vSphere datastore for ISO images. (e.g. 'sfo-w01-cl01-nfs01')"
  default = ""
  }

variable "iso_path" {
  type    = string
  description = "The path on the source vSphere datastore for ISO images. (e.g. 'iso')"
  default = ""
  }

variable "iso_file" {
  type    = string
  description = "The file name of the ISO image. (e.g. 'iso-redhat-server-8.iso')"
  default = ""
}

variable "iso_checksum" {
  type    = string
  description = "The SHA-512 checkcum of the ISO image. (e.g. Result of 'shasum -a 512 iso-redhat-server-8.iso')"
  default = ""
}

# HTTP Endpoint for Kickstart

variable "http_directory" {
  type    = string
  description = "The HTTP endpoint directory path. (e.g. ../../../configs/linux/redhat-server/)"
  default = ""
}

variable "http_file" {
  type    = string
  description = "The guest operating system kickstart file. (e.g. ks.cfg)"
  default = ""
}

# Virtual Machine Settings

variable "vm_guest_os_family" {
  type    = string
  description = "The guest operatiing system family. Used for naming and VMware tools. (e.g. 'linux')"
  default = ""
}

variable "vm_guest_os_vendor" {
  type    = string
  description = "The guest operatiing system vendor. Used for naming . (e.g. 'redhat')"
  default = ""
}

variable "vm_guest_os_member" {
  type    = string
  description = "The guest operatiing system member. Used for naming. (e.g. 'server')"
  default = ""
}

variable "vm_guest_os_version" {
  type    = string
  description = "The guest operatiing system version. Used for naming. (e.g. '7')"
  default = ""
}

variable "vm_guest_os_type" {
  type    = string
  description = "The guest operating system type, also know as guestid. (e.g. 'rhel7_64Guest')"
  default = ""
}

variable "vm_version" {
  type    = number
  description = "The vSphere virtual hardware version. Refer to https://kb.vmware.com/kb/1003746. (e.g. '18')"
  default = 18
}

variable "vm_firmware" {
  type    = string
  description = "The virtual machine firmware. (e.g. 'bios' or 'efi-secure')"
  default = "efi"
}

variable "vm_cdrom_type" {
  type    = string
  description = "The virtual machine CD-ROM type. (e.g. 'sata', or 'ide')"
  default = "sata"
}

variable "vm_cpu_sockets" {
  type    = number
  description = "The number of virtual CPUs sockets. (e.g. '2')"
  default = 2
}

variable "vm_cpu_cores" {
  type    = number
  description = "The number of virtual CPUs cores per socket. (e.g. '1')"
  default = 1
}

variable "vm_mem_size" {
  type    = number
  description = "The size for the virtual memory in MB. (e.g. '2048')"
  default = 4096
}

variable "vm_disk_size" {
  type    = number
  description = "The size for the virtual disk in MB. (e.g. '40960')"
  default = 40960
}

variable "vm_bootdisk_size" {
  type    = number
  description = "The size for the virtual disk in MB. (e.g. '40960')"
  default = 40960
}

variable "vm_datadisk_size" {
  type    = number
  description = "The size for the virtual disk in MB. (e.g. '40960')"
  default = 81920
}

variable "vm_disk_controller_type" {
  type    = string
  default = "pvscsi"
}

variable "vm_network_card" {
  type    = string
  description = "The virtual network card type. (e.g. 'vmxnet3' or 'e1000e')"
  default = "vmxnet3"
}

variable "vm_boot_wait" {
  type    = string
  description = "The time to wait before boot. "
  default = "2s"
}

variable "shell_scripts" {
  type    = list(string)
  description = "A list of script and their relative paths to transfer and execute using SSH."
  default = []
}


#variable "builderip"          {default = "10.103.1.17"}
# variable "vm_boot_command" {
#   type = list(string)
#   description = "The text to enter for booting from the CD and location of the kickstart file."
# }

variable "vm_template_folder" {
    type = string
    description = "The folder to put the template in in vSphere."
}


##################################################################################
# LOCALS
##################################################################################

locals { 
  buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  }

##################################################################################
# SOURCE
##################################################################################

source "vsphere-iso" "linux-redhat-server7" {
  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  datacenter           = var.vcenter_datacenter
  cluster              = var.vcenter_cluster
  # resource_pool       = var.vcenter_resource_pool
  datastore            = var.vcenter_datastore
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = false
  guest_os_type        = var.vm_guest_os_type
  vm_version           = var.vm_version
  notes                = "Built by HashiCorp Packer on ${local.buildtime}. Version 1.0.0 - Main/Prod"
  vm_name              = "${var.vm_guest_os_family}-${var.vm_guest_os_vendor}-${var.vm_guest_os_member}-${var.vm_guest_os_version}"
  firmware             = var.vm_firmware
  CPUs                 = var.vm_cpu_sockets
  cpu_cores            = var.vm_cpu_cores
  CPU_hot_plug         = true
  RAM                  = var.vm_mem_size
  RAM_hot_plug         = true
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = ["${var.vm_disk_controller_type}", "${var.vm_disk_controller_type}"]
  storage {
    disk_controller_index = 0
    disk_size             = "${var.vm_bootdisk_size}"
  }
 # storage {
 #   disk_controller_index = 1
 #   disk_size             = "${var.vm_datadisk_size}"
 #   disk_thin_provisioned = true
 # }
  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }
  iso_paths                = ["${ var.iso_datastore }${ var.iso_path }/${ var.iso_file }"]
  #iso_checksum             = "sha512:var.iso_checksum"
  iso_checksum             = "none"
  http_directory           = var.http_directory
  boot_order               = "disk,cdrom"
  boot_wait                = var.vm_boot_wait
  http_port_min    = 8000
  http_port_max    = 8099

#https://github.com/vmware-samples/packer-examples-for-vsphere/blob/main/builds/linux/rhel/8/linux-rhel.pkr.hcl
#https://serverfault.com/questions/1049693/oel8-kickstart-install-on-esxi-hangs-at-reached-target-basic-system-why
 cd_files = ["./configs/ks-rhel7.cfg"] 
 cd_label = "autoinstall"
  boot_command = [
    "<up>",
    "e",
    "<down><down><end><wait>",
    "vmlinuz initrd=initrd.img ip=10.106.68.120::10.106.68.1:255.255.255.0:pranchrhel7tmp:ens224:none nameserver=10.0.3.72  nameserver=10.0.3.71 text inst.ks=cdrom:/ks-rhel7.cfg",
#    "vmlinuz initrd=initrd.img ip=10.106.68.120::10.106.68.1:255.255.255.0:pranchrhel7tmp:ens224:none nameserver=10.0.3.72  nameserver=10.0.3.71 text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.http_file}",

    "<enter><wait><leftCtrlOn>x<leftCtrlOff>"
  ]


  ip_wait_timeout          = "20m"
  ssh_password             = var.build_password
  ssh_username             = var.build_username
  ssh_port                 = 22
  ssh_timeout              = "20m"
  ssh_handshake_attempts   = "20"
  shutdown_command         = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout         = "15m"
  /*
  Comment or remove the option below to exclude the use of the vSphere content library.
  - If ovf = true - the virtual machine image is exported to the target content library.
  - If destroy = true - the virtual machine image is destroyed after a successfully exported the target content library
  - By default, the target name is the vm_name unless name = "foo" is provided.
  - The content library item is updated if the target name is the same. 
  */
   content_library_destination {
     library = var.vcenter_content_library
     ovf     = true
     destroy = true
   }
}

##################################################################################
# BUILD
##################################################################################

build {
  sources = ["source.vsphere-iso.linux-redhat-server7"]
  /*
  Uses the File Provisioner to copy the public key.
  - The Shell Provisioner will execute a script that imports the public key to authorized_keys to the build user.
  */ 
  provisioner "file" {
    destination = "/tmp/rhsm.conf"
    source = "../../../configfiles/rhsm.conf"
  }
  provisioner "file" {
    destination = "/tmp/ad_realm_auth.sh"
    source = "scripts/ad_realm_auth.sh"
  }
  provisioner "file" {
    destination = "/tmp/auditd.conf"
    source = "../../../configfiles/auditd.conf"
  }
  provisioner "file" {
    destination = "/tmp/postfix.sh"
    source = "scripts/postfix.sh"
  }
  provisioner "file" {
    destination = "/tmp/crypto_policy.sh"
    source = "scripts/crypto_policy.sh"
  }
  provisioner "file" {
    destination = "/tmp/sshd_ciphers.sh"
    source = "scripts/sshd_ciphers.sh"
  } 
  provisioner "file" {
    destination = "/tmp/main.cf"
    source = "../../../configfiles/main.cf"
  }
  provisioner "file" {
    destination = "/tmp/selinux.sh"
    source = "scripts/selinux.sh"
  }
  provisioner "file" {
    destination = "/tmp/add_forescout_key.sh"
    source = "scripts/add_forescout_key.sh"
  }
  provisioner "file" {
    destination = "/tmp/config"
    source = "../../../configfiles/config"
  }
  provisioner "file" {
    destination = "/tmp/auditd.sh"
    source = "scripts/auditd.sh"
  }
   provisioner "file" {
    destination = "/tmp/xrpms-rh8.sh"
    source = "scripts/xrpms-rh8.sh"
  } 
  provisioner "file" {
    destination = "/tmp/xrpms-rh8.sh"
    source = "scripts/xrpms-rh8.sh"
  } 
  provisioner "file" {
    destination = "/tmp/harden.sh"
    source = "scripts/harden.sh"
  }
  provisioner "file" {
    destination = "/tmp/audit.rules"
    source = "../../../configfiles/audit.rules"
  }
  provisioner "file" {
    destination = "/tmp/auoms.conf"
    source = "../../../configfiles/audit_plugins/auoms.conf"
  }
  provisioner "file" {
    destination = "/tmp/sedispatch.conf"
    source = "../../../configfiles/audit_plugins/sedispatch.conf"
  }
  provisioner "file" {
    destination = "/tmp/audit.rules"
    source = "../../../configfiles/audit_rulesd/audit.rules"
  }
  provisioner "file" {
    destination = "/tmp/auoms.rules"
    source = "../../../configfiles/audit_rulesd/auoms.rules"
  }
  provisioner "file" {
    destination = "/tmp/cis.rules"
    source = "../../../configfiles/audit_rulesd/cis.rules"
  }
  provisioner "file" {
    destination = "/tmp/linux-install-cortex.sh"
    source = "scripts/linux-install-cortex.sh"
  }
  provisioner "file" {
    destination = "/tmp/linux-install-oms.sh"
    source = "scripts/linux-install-oms.sh"
  }
  provisioner "file" {
    destination = "/tmp/linux-install-rapid7.sh"
    source = "scripts/linux-install-rapid7.sh"
  }
  provisioner "file" {
    destination = "/tmp/gto-security-engineering.sh"
    source = "scripts/gto-security-engineering.sh"
  }
  provisioner "file" {
    destination = "/tmp/non_realm_auth.sh"
    source = "scripts/non_realm_auth.sh"
  }
  provisioner "file" {
    destination = "/tmp/modprobe.sh"
    source = "scripts/modprobe.sh"
  }
  provisioner "file" {
    destination = "/tmp/modprobe.conf"
    source = "../../../configfiles/modprobe.conf"
  }
  provisioner "file" {
    destination = "/tmp/95-omsagent.conf"
    source = "../../../configfiles/rsyslogd/95-omsagent.conf"
  }
  provisioner "file" {
    destination = "/tmp/rsyslogd.sh"
    source = "scripts/rsyslogd.sh"
  }
  provisioner "file" {
    destination = "/tmp/rsyslog.conf"
    source = "../../../configfiles/rsyslogd/rsyslog.conf"
  }
  provisioner "file" {
    destination = "/tmp/logrotate.sh"
    source = "scripts/logrotate.sh"
  }
  provisioner "file" {
    destination = "/tmp/logrotate.conf"
    source = "../../../configfiles/logrotate/logrotate.conf"
  }
  provisioner "file" {
    destination = "/tmp/fstab_cleanup.sh"
    source = "scripts/fstab_cleanup.sh"
  }
  provisioner "file" {
    destination = "/tmp/aide.sh"
    source = "scripts/aide.sh"
  }
  provisioner "file" {
    destination = "/tmp/mkfs_device.sh"
    source = "scripts/mkfs_device.sh"
  }
  provisioner "file" {
    destination = "/tmp/setmipcregionoptions.sh"
    source = "scripts/setmipcregionoptions.sh"
  }  
  provisioner "file" {
    destination = "/tmp/exportproxies.sh"
    source = "scripts/exportproxies.sh"
  }  
  provisioner "file" {
    destination = "/tmp/ga_issuing.cer"
    source = "../../../certificates/ga_issuing.cer"
  }
  provisioner "file" {
    destination = "/tmp/ga_root.cer"
    source = "../../../certificates/ga_root.cer"
  }
  provisioner "file" {
    destination = "/tmp/ga_issuing_2023.cer"
    source = "../../../certificates/ga_issuing_2023.cer"
  }
  provisioner "file" {
    destination = "/tmp/ga_root_2023.cer"
    source = "../../../certificates/ga_root_2023.cer"
  }  
  provisioner "file" {
    destination = "/tmp/intmgmt_root.cer"
    source = "../../../certificates/intmgmt_root.cer"
  }  
  provisioner "file" {
    destination = "/tmp/cssroot.crt"
    source = "../../../certificates/cssroot.crt"
  }  
  provisioner "file" {
    destination = "/tmp/rsyslog.conf.phl"
    source = "../../../configfiles/rsyslog.conf.phl"
  }
  provisioner "file" {
    destination = "/tmp/rsyslog.conf.phx"
    source = "../../../configfiles/rsyslog.conf.phx"
  }
  provisioner "file" {
    destination = "/tmp/syslog"
    source = "../../../configfiles/syslog"
  }
  provisioner "file" {
    destination = "/tmp/disable_ipv6.sh"
    source = "scripts/disable_ipv6.sh"
  }
  provisioner "file" {
    destination = "/tmp/authorized_keys"
    source = "../../../keys/authorized_keys"
  }
  # provisioner "file" {
  #   destination = "/tmp/epel-release-latest-8.noarch.rpm"
  #   source = "../../../rhelbinaries/epel-release-latest-8.noarch.rpm"
  # }
  provisioner "file" {
    destination = "/tmp/check_memory"
    source = "scripts/check_memory"
  }
  provisioner "file" {
    destination = "/tmp"
    source = "../../../IPcenter_agents/"
  }
  provisioner "file" {
    destination = "/tmp/exportproxies.sh"
    source = "scripts/exportproxies.sh"
  }
  provisioner "file" {
    destination = "/tmp/neosat.conf"
    source = "scripts/neosat.conf"
  }
  provisioner "file" {
    destination = "/tmp/OMS-Agent-for-Linux-OMSAgent_v1.14.9-0.zip"
    source = "../../../rhelbinaries/oms/OMS-Agent-for-Linux-OMSAgent_v1.14.9-0.zip"
  }
  provisioner "file" {
    destination = "/tmp/goss"
    source = "../../../rhelbinaries/goss/goss"
  }
  provisioner "file" {
    destination = "/tmp/goss.sh"
    source = "scripts/goss.sh"
  }
  // Uses the Shell Provisioner to execute a series of inline commands defined in the variables
  provisioner "shell" {
    expect_disconnect = true
    execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "RHSM_USERNAME=${var.rhsm_username}",
      "RHSM_PASSWORD=${var.rhsm_password}",
      "VCENTER_ENVIRONMENT=${var.vcenter_environment}"
    ]
    scripts = [
      "scripts/pwd_less_sudo.sh",  
      "scripts/configmipcdirectory.sh",   
      "scripts/createcronjobs.sh", 
      "scripts/satellite.sh",      
      "scripts/packagesandupdates.sh",
      "scripts/ipcenteragents.sh",      
      "scripts/certs.sh",
     # "scripts/postfix.sh",
      "scripts/yumupdates.sh",
      "scripts/crypto_policy.sh", 
      "scripts/auditd.sh",
      "scripts/rsyslogd.sh",
      "scripts/logrotate.sh",   
      "scripts/modprobe.sh",
      "scripts/disable_ipv6.sh",
      "scripts/reboot.sh"
    ]
  }
  // Uses the Shell Provisioner to execute a series of inline commands defined in the variables
  provisioner "shell" {
    expect_disconnect = true
    execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "RHSM_USERNAME=${var.rhsm_username}",
      "RHSM_PASSWORD=${var.rhsm_password}",
      "VCENTER_ENVIRONMENT=${var.vcenter_environment}"
    ]
    scripts = [
      "scripts/noop.sh",
     # "scripts/cis_audit.sh",
     # "scripts/goss.sh",
      "scripts/harden_prereqs.sh",
      "scripts/ad_realm_auth.sh",
      "scripts/non_realm_auth.sh",
      "scripts/gto-security-engineering.sh",
     # "scripts/linux-install-rapid7.sh",
     # "scripts/linux-install-oms.sh",
     # "scripts/linux-install-cortex.sh",
      "scripts/configrsyslog.sh",
      "scripts/selinux.sh",
      "scripts/set_timezone.sh", 
      "scripts/sshd_ciphers.sh",
      "scripts/add_forescout_key.sh",
      "scripts/harden.sh",
      "scripts/remove_packages.sh",
      "scripts/fstab_cleanup.sh",
      "scripts/aide.sh", 
      "scripts/cleanup.sh",
      "scripts/reboot.sh"
    ]
  }
  #provisioner "ansible" {
  #  playbook_file = "ansible/addmipccronjob.yml"
  #}
  provisioner "shell" {
    expect_disconnect = true
    execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "RHSM_USERNAME=${var.rhsm_username}",
      "RHSM_PASSWORD=${var.rhsm_password}",
      "VCENTER_ENVIRONMENT=${var.vcenter_environment}"
    ]
    scripts = [
      "scripts/localposttests.sh"
    ]
  }   
  error-cleanup-provisioner "shell" {
    expect_disconnect = true
    execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
    environment_vars = [
      "BUILD_USERNAME=${var.build_username}",
      "RHSM_USERNAME=${var.rhsm_username}",
      "RHSM_PASSWORD=${var.rhsm_password}",
      "VCENTER_ENVIRONMENT=${var.vcenter_environment}"
    ]
    scripts = [
      "scripts/errcleanup.sh"
    ]
  }
}

