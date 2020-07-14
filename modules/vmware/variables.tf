variable "vsphere_server" {
   default = "vcsa.localdc.custom_domain.com"
}

variable "vsphere_user" {
   default = "administrator@vsphere.local"
}

variable "vsphere_password" {
   default  = "NEED TO CHANGE"
}

variable "vsphere_resource_pool" {
   default = "/LOCALDC/host/LOCALDC_ESX_POOL/Resources"
}

variable "vsphere_datacenter" {
   default = "LOCALDC"
}

variable "vsphere_root_folder" {
   default = "LOCALDC"
}

variable "vsphere_datastore" {
   default = "san-hostname-01"
}

variable "vsphere_allow_unverified_ssl" {
   default = 1
}

variable "vsphere_source_image_folder" {
   default = "vm/ubuntu-1804-production.ova/"
}

variable "vsphere_source_image_name" {
   default = "ubuntu-1804-production.ova"
}

variable "vsphere_vm_domain" {
   default = "localdc.custom_domain.com"
}

variable "vsphere_vm_folder" {
}

variable "host_list" {
  type=set(string)
  default=[]
}

variable "cpu" {
   default = 2
}

variable "ram" {
   default = 4096
}

variable "hdd" {
   default = 20
}

variable "vsphere_dns_suffix_list" {
  type = list(string)
  default = ["localdc.custom_domain.com"]
}

variable "vsphere_dns_servers" {
  type = list(string)
  default = [
      "",
      "",
  ]
}

variable "vsphere_vm_subnet" {
}

variable "vsphere_vm_gateway" {
}

variable "vsphere_network" {
}
