##################################################################################
# Credentials
##################################################################################

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_username
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_insecure
}


##################################################################################
# vSphere Settings
##################################################################################

data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

##################################################################################
# Virtual Machine Settings
##################################################################################

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  count = var.vm-count

#  name                    = var.vm_name
   name                   = "${var.vm_name}-${count.index + 1}"
  folder                  = var.vsphere_folder
  num_cpus                = var.vm_cpus
  memory                  = var.vm_memory
  firmware                = var.vm_firmware
  efi_secure_boot_enabled = var.vm_efi_secure_boot_enabled
  guest_id                = data.vsphere_virtual_machine.template.guest_id
  datastore_id            = data.vsphere_datastore.datastore.id
  resource_pool_id        = data.vsphere_resource_pool.pool.id
  annotation           = var.vm_annotation
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
  #  label            = "disk0"
    label = "${var.vm_name}-${count.index + 1}-disk"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }

##################################################################################
# Virtual Machine Clone from Template Settings
##################################################################################

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
      #  host_name = var.vm_hostname
      host_name = "${var.vm_name}-${count.index + 1}"
        domain    = var.vm_domain
      }
      network_interface {
       # ipv4_address = var.vm_ipv4_address
       ipv4_address = "${var.vm_ipv4_address}${121 + count.index}"

        ipv4_netmask = var.vm_ipv4_netmask
      }

      ipv4_gateway    = var.vm_ipv4_gateway
      dns_suffix_list = var.vm_dns_suffix_list
      dns_server_list = var.vm_dns_server_list
    }
  }
  lifecycle {
    ignore_changes = [
      clone[0].template_uuid,
    ]
  }

 # provisioner "local-exec" {
 #   command = "echo 'Oph0Du4On7Haf9Ve1Jo6Ry0' | sudo realm leave --remove --user=svc_adjoin css.cgipdc.cginet || true"
 #   interpreter = ["/bin/bash", "-c"]
 # }

 # provisioner "local-exec" {
 #   command = "echo 'Oph0Du4On7Haf9Ve1Jo6Ry0'| sudo realm join --user=svc_adjoin --computer-ou='OU=IaC,OU=Unix,OU=Tier 1,OU=Staff,OU=MGMT,DC=css,DC=cgipdc,DC=cginet' css.cgipdc.cginet || true"
 #   interpreter = ["/bin/bash", "-c"]
 # }

 # provisioner "local-exec" {
 #   command = "sudo realm permit svc_unixiac@CSS.CGIPDC.CGINET"
 #   interpreter = ["/bin/bash", "-c"]
 # }

}
