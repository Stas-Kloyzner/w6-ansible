#root module variables

#rg variables
variable "environment" {
  description = "the name of the workspace, resource group and all components will be named based on it"
  default     = "staging"
}
variable "location" {
  description = "location of the resource group"
  default     = "eastus"
}

#vnet variables
variable "vnet_address_space" {
  description = "vnet address space"
  type        = string
  default     = "10.0.0.0"
}

data "http" "ip" {
  url = "https://ifconfig.me"
}

# db variables
variable "db_administrator_login" {
  description = "db administrator username"
  type        = string
  default     = "pgadmin"
}
variable "db_administrator_password" {
  description = "db administrator password"
  type        = string
  default     = "p@sSw0rD"
}
variable "db_zone" {
  description = "db zone"
  default     =  1
}
variable "storage_mb" {
  type        = number
  description = "pg flexible server storage size in mb"
  default     = 32768
}
#linux-vmss variables
variable "vmss_admin_username" {
  description = "vmss admin username"
  type = string
  default = "vmssadmin" #default username
}
variable "vmss_admin_password" {
  description = "vmss admin password"
  type        = string
  default     = "ad@M12345678" #default password
}
variable "vmss_instances" {
  description = "default number of vmss machines"
  type        = number
}

variable "machine_type" {
  description = "type of machine to be provisioned for vmss"
  type        = string
  default     = "Standard_B1s"
}