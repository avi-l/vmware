provider "dns" {
}

data "dns_a_record_set" "lookup" {
  for_each = var.host_list
  host = "${each.key}.${var.vsphere_vm_domain}"
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
  #version = "=1.3.0"
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_source_image_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "template_file" "vm_cloudinit_metadata" {
  template = file("${path.module}/cloudinit_metadata.tpl")
  for_each = var.host_list

  vars = {
    instance_id     = "${each.key}.${var.vsphere_vm_domain}"
    dns_nameservers = join(" ", var.vsphere_dns_servers)
    dns_search      = var.vsphere_vm_domain
  }
}

 data "template_file" "vm_cloudinit_userdata" {
  template = file("${path.module}/cloudinit.yaml")

 }


resource "vsphere_virtual_machine" "vm" {
  for_each = var.host_list
  name = "${each.key}.${var.vsphere_vm_domain}"

  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vsphere_vm_folder

  num_cpus = var.cpu
  memory   = var.ram
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    name = "${each.key}.${var.vsphere_vm_domain}.vmdk"
    size = var.hdd
    thin_provisioned = false
    eagerly_scrub = true
  }

  cdrom {
    client_device = true
  }

  extra_config = {
    "guestinfo.cloudinit.metadata" = base64gzip(data.template_file.vm_cloudinit_metadata[each.key].rendered)
    "guestinfo.cloudinit.metadata.encoding" = "gzip+base64"

    "guestinfo.cloudinit.userdata" = base64gzip(data.template_file.vm_cloudinit_userdata.rendered)
    "guestinfo.cloudinit.userdata.encoding" = "gzip+base64"
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.key
        domain    = var.vsphere_vm_domain
      }
      network_interface {
        ipv4_address = data.dns_a_record_set.lookup[each.key].addrs[0]
        ipv4_netmask = 24
      }
    ipv4_gateway = var.vsphere_vm_gateway
    dns_server_list     = var.vsphere_dns_servers
    dns_suffix_list     = var.vsphere_dns_suffix_list
    }
  }

}
