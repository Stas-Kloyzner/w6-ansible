# linux-vmss module variables
variable "resource_group_name" {}

variable "location" {}

variable "machine_type" {
  description = "type of machine to be provisioned for vmss"
  type        = string
  default     = "Standard_B1s"
}

variable  "admin_username" {
  type        = string
  description = "scaleset admin username"
  default     = "ssadmin"
}
variable "admin_password" {
  type        = string
  description = "scaleset admin password"
  default     = "superSECRETp@ssw0rd!"
}
variable "instances" {
  type        = number
  description = "number of scaleset instances"
  default     = 1
}
variable "upgrade_mode" {
  type        = string
  description = "scaleset upgrade mode"
  default     = "Automatic"
}
# linux-vmss ip configuration varibles
variable "ip_configuration_name" {
  type        = string
  description = "scaleset ip configuration name"
  default     = "internal-ip"
}
variable "subnet_id" {}
variable "load_balancer_backend_address_pool_ids" {}
variable "load_balancer_inbound_nat_rules_ids" {}