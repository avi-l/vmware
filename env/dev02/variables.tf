variable "vsphere_vm_folder" {
   default = ""
}
variable "vsphere_vm_subnet" {
   default = ""
}
variable "vsphere_vm_gateway" {
   default = ""
}
variable "vsphere_vm_domain" {
   default = ""
}
variable "vsphere_network" {
   default = ""
}
variable "vsphere_dns_suffix_list" {
  type = list(string)
  default = [
    "",
    "",
  ]
}
