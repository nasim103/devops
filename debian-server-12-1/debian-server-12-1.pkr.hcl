# 
# Packer tenmplate for Debian Server 12.
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
  type      = string
  description = "The password for the login to the guest operating system."
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
  description = "The file name of the ISO image. (e.g. 'debian-12.1.0-amd64-DVD-1')"
  default = ""
}

variable "iso_checksum" {
  type    = string
  description = "The SHA-512 checkcum of the ISO image. (e.g. Result of 'shasum -a 512 debian-12.1.0-amd64-DVD-1')"
  default = ""
}

# Virtual Machine Settings

variable "vm_guest_os_family" {
  type    = string
  description = "The guest operatiing system family. Used for naming and VMware tools. (e.g. ''linux')"
  default = ""
}

variable "vm_guest_os_vendor" {
  type    = string
  description = "The guest operatiing system vendor. Used for naming . (e.g. 'debian')"
  default = ""
}

variable "vm_guest_os_member" {
  type    = string
  description = "The guest operatiing system member. Used for naming. (e.g. 'server')"
  default = ""
}

variable "vm_guest_os_version" {
  type    = string
  description = "The guest operatiing system version. Used for naming. (e.g. '12-1')"
  default = ""
}

variable "vm_guest_os_type" {
  type    = string
  description = "The guest operating system type, also know as guestid. (e.g. 'debian10Guest')"
  default = ""
}

variable "vm_version" {
  type    = number
  description = "The vSphere virtual hardware version. Refer to https://kb.vmware.com/kb/1003746. (e.g. '18')"
  default = 18
}

variable "vm_firmware" {
  type    = string
  description = "The virtual machine firmware. (e.g. 'bios' or 'efi')"
  default = "bios"
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
  default = 2048
}

variable "vm_disk_size" {
  type    = number
  description = "The size for the virtual disk in MB. (e.g. '40960')"
  default = 40960
}

variable "vm_disk_controller_type" {
  type    = list(string)
  description = "The virtual disk controller types in sequence. (e.g. 'pvscsi')"
  default = ["pvscsi"]
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

##################################################################################
# LOCALS
##################################################################################

locals { 
  buildtime = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
  }

##################################################################################
# SOURCE
##################################################################################

source "vsphere-iso" "linux-debian-server" {
  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  datacenter           = var.vcenter_datacenter
  cluster              = var.vcenter_cluster
  datastore            = var.vcenter_datastore
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = false
  guest_os_type        = var.vm_guest_os_type
  vm_version           = var.vm_version
  notes                = "Built by HashiCorp Packer on ${local.buildtime}. Version 1.0.0 - Develop"
  vm_name              = "${var.vm_guest_os_family}-${var.vm_guest_os_vendor}-${var.vm_guest_os_member}-${var.vm_guest_os_version}"
  firmware             = var.vm_firmware
  CPUs                 = var.vm_cpu_sockets
  cpu_cores            = var.vm_cpu_cores
  CPU_hot_plug         = true
  RAM                  = var.vm_mem_size
  RAM_hot_plug         = true
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type
  storage {
    disk_size             = var.vm_disk_size
    disk_controller_index = 0
    disk_thin_provisioned = false
  }
  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }
  iso_paths                 = ["${ var.iso_datastore }${ var.iso_path }/${ var.iso_file }"]
  iso_checksum              = "sha512:var.iso_checksum"
  boot_order                = "disk,cdrom"
  boot_wait                 = var.vm_boot_wait
  cd_files = ["./configs/preseed.cfg"]
  cd_label                  = "cdrom2"
  boot_command= [ 
    "c<wait>", "<esc>", "c<wait>", "linux /install.amd/vmlinuz", " auto-install/enable=true", " debconf/priority=critical", " preseed/file=/mnt/cdrom2/preseed.cfg<enter><wait>", "initrd /install.amd/initrd.gz<enter><wait>", "boot<enter><wait>", "<wait10s><leftAltOn><f2><leftAltOff>", "<enter><wait>", "mkdir /mnt/cdrom2<enter>", "mount /dev/sr1 /mnt/cdrom2<enter>", "<leftAltOn><f1><leftAltOff>", "<enter><wait><enter>", "<down><down><down><down><enter>" 
  ]

  
  ip_wait_timeout           = "20m"
  ssh_password              = var.build_password
  ssh_username              = var.build_username
  ssh_port                  = 22
  ssh_timeout               = "20m"
  ssh_handshake_attempts    = "20"
  shutdown_command          = "echo '${var.build_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout          = "15m"
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
  sources = ["source.vsphere-iso.linux-debian-server"]
  /*
  Uses the File Provisioner to copy the public key.
  - The Shell Provisioner will execute a script that imports the public key to authorized_keys to the build user.
  */ 
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
    destination = "/tmp/authorized_keys"
    source = "../../../keys/authorized_keys"
  }

  /* Uses the Shell Provisioner to execute a series of inline commands defined in the variables
  // provisioner "shell" {
  //  execute_command = "echo '${var.build_password}' | {{.Vars}} sudo -E -S sh -eux '{{.Path}}'"
  //  environment_vars = [
  //    "BUILD_USERNAME=${var.build_username}",
  //  ]
  //  # scripts = var.shell_scripts
  //  expect_disconnect = true
  // }
  */
}
