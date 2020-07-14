module "host_m" {
  source = "../../modules/vmware"

  host_list = [
    "host_m01",
    "host_m02",
  ]
  cpu = 4
  ram = 9500
  hdd = 25

  vsphere_vm_folder  = var.vsphere_vm_folder
  vsphere_vm_subnet  = var.vsphere_vm_subnet
  vsphere_vm_gateway = var.vsphere_vm_gateway
  vsphere_vm_domain  = var.vsphere_vm_domain
  vsphere_network    = var.vsphere_network
  vsphere_dns_suffix_list = var.vsphere_dns_suffix_list
}

module "host_w" {
  source = "../../modules/vmware"

  host_list = [
    "host_w01",
    "host_w02",
  ]
  cpu = 8
  ram = 9500
  hdd = 25

  vsphere_vm_folder  = var.vsphere_vm_folder
  vsphere_vm_subnet  = var.vsphere_vm_subnet
  vsphere_vm_gateway = var.vsphere_vm_gateway
  vsphere_vm_domain  = var.vsphere_vm_domain
  vsphere_network    = var.vsphere_network
  vsphere_dns_suffix_list = var.vsphere_dns_suffix_list
}

module "host_a" {
  source = "../../modules/vmware"

  host_list = [
    "host_a01",
    "host_a02",
  ]
  cpu = 4
  ram = 9500
  hdd = 25

  vsphere_vm_folder = var.vsphere_vm_folder
  vsphere_vm_subnet = var.vsphere_vm_subnet
  vsphere_vm_gateway = var.vsphere_vm_gateway
  vsphere_vm_domain = var.vsphere_vm_domain
  vsphere_network = var.vsphere_network
  vsphere_dns_suffix_list = var.vsphere_dns_suffix_list
}

module "host_r" {
  source = "../../modules/vmware"

  host_list = [
    "host_r01",
    "host_r02",
  ]
  cpu = 8
  ram = 9500
  hdd = 25

  vsphere_vm_folder  = var.vsphere_vm_folder
  vsphere_vm_subnet  = var.vsphere_vm_subnet
  vsphere_vm_gateway = var.vsphere_vm_gateway
  vsphere_vm_domain  = var.vsphere_vm_domain
  vsphere_network    = var.vsphere_network
  vsphere_dns_suffix_list = var.vsphere_dns_suffix_list
}

module "host_s" {
  source = "../../modules/vmware"

  host_list = [
    "host_s01",
    "host_s02",
  ]
  cpu = 2
  ram = 9500
  hdd = 25

  vsphere_vm_folder  = var.vsphere_vm_folder
  vsphere_vm_subnet  = var.vsphere_vm_subnet
  vsphere_vm_gateway = var.vsphere_vm_gateway
  vsphere_vm_domain  = var.vsphere_vm_domain
  vsphere_network    = var.vsphere_network
  vsphere_dns_suffix_list = var.vsphere_dns_suffix_list
}

module "host_z" {
  source = "../../modules/vmware"

  host_list = [
    "host_z01",
  ]
  cpu = 1
  ram = 5500
  hdd = 25

  vsphere_vm_folder  = var.vsphere_vm_folder
  vsphere_vm_subnet  = var.vsphere_vm_subnet
  vsphere_vm_gateway = var.vsphere_vm_gateway
  vsphere_vm_domain  = var.vsphere_vm_domain
  vsphere_network    = var.vsphere_network
  vsphere_dns_suffix_list = var.vsphere_dns_suffix_list
}