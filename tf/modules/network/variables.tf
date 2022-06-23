# network module variables
variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {
  description = "the name of the vnet to be created"
}
variable "vnet_address_space" {
  description = "the vnet address space"
}
variable "source_address_prefix" {
  description = "ips allowed to ssh , you should enter your ip"
}