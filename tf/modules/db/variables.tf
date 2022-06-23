# db module variables

variable "resource_group_name" {}
variable "location" {}
variable "vnet_address_space" {}
variable "virtual_network_name" {}
variable "virtual_network_id" {}
variable "administrator_login" {}
variable "administrator_password" {}
variable "zone" {}
variable "storage_mb" {
  description = "pg flexible server storage size in mb"
}