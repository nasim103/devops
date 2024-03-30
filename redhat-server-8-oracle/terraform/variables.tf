##################################################################################
# VARIABLES
##################################################################################

##################################################################################
# Credentials
##################################################################################


variable "vsphere_server" {
  type = string
}

variable "vsphere_username" {
  type = string
  sensitive = true
}

variable "vsphere_password" {
  type = string
  sensitive = true
}

variable "vsphere_insecure" {
  type    = bool
  default = false
}

##################################################################################
# vSphere Settings
##################################################################################

variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_cluster" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_folder" {
  type = string
}

variable "vsphere_network" {
  type = string
}

variable "vsphere_template" {
  type = string
}

##################################################################################
# Content Library
##################################################################################

variable "vsphere_content_library_item" {
  type = string
}

variable "vsphere_content_library" {
  type = string
}


##################################################################################
# Virtual Machine Settings
##################################################################################

variable "vm_name" {
  type = string
}

variable "vm_annotation" {
  type = string
}

variable "vm_cpus" {
  type = number
}

variable "vm_memory" {
  type = number
}

variable "disk_01_size" {
  type = number
}

variable "vm_firmware" {
  type = string
}

variable "vm_efi_secure_boot_enabled" {
  type = bool
}

variable "vm_hostname" {
  type = string
}

variable "vm_domain" {
  type = string
}

variable "vm_ipv4_address" {
  type = string
}

variable "vm_ipv4_netmask" {
  type = string
}

variable "vm_ipv4_gateway" {
  type = string
}

variable "vm_dns_suffix_list" {
  type = list(string)
}

variable "vm_dns_server_list" {
  type = list(string)
}

variable "num_cores_per_socket" {
  type = number
}

variable "memory_hot_add_enabled" {
  type = string
}

variable "cpu_hot_add_enabled" {
  type = string
}
