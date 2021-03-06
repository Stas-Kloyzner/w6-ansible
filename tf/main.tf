#root module main

resource "azurerm_resource_group" "rg" {
  name     = var.environment
  location = var.location
}

module "Vnet" {
  source = "./modules/network"

  resource_group_name= azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  vnet_name = "${azurerm_resource_group.rg.name}-vnet"
  vnet_address_space = var.vnet_address_space
  source_address_prefix = data.http.ip.body

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "pg_f_db" {
  source = "./modules/db"

  resource_group_name= azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  virtual_network_name = module.Vnet.name
  virtual_network_id = module.Vnet.vnet_id
  vnet_address_space = var.vnet_address_space
  administrator_login = var.db_administrator_login
  administrator_password = var.db_administrator_password
  zone = var.db_zone
  storage_mb = var.storage_mb

    depends_on = [
    module.Vnet
  ]
}

#load balancer
module "lb" {
  source = "./modules/load-balancer"

  resource_group_name= azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  network_interface_id = module.vm_scale_set.network_interface_id
  ip_configuration_name = module.vm_scale_set.ip_configuration_name
}
#linux vm scale set
module "vm_scale_set" {
  source = "./modules/linux-vmss"

  resource_group_name= azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  subnet_id = module.Vnet.subnet_id
  load_balancer_backend_address_pool_ids = module.lb.load_balancer_backend_address_pool_ids
  load_balancer_inbound_nat_rules_ids = module.lb.load_balancer_inbound_nat_rules_ids
  admin_username = var.vmss_admin_username
  admin_password = var.vmss_admin_password
  instances = var.vmss_instances
  machine_type = var.machine_type

  depends_on = [module.pg_f_db]
}
#create yaml vars file for ansible
resource "local_file" "tf_ansible_vars_file" {
  content = <<-DOC
    # Ansible vars_file containing variable values from Terraform.
    # Generated by Terraform mgmt configuration.

    resource_group: ${azurerm_resource_group.rg.name}
    scaleset_name: ${module.vm_scale_set.scaleset_name}
    loadbalancer_name: ${module.lb.load_balancer_name}
    admin_username: ${module.vm_scale_set.scaleset_username}
    admin_password: ${module.vm_scale_set.scaleset_password}
    db_username: ${module.pg_f_db.db_admin_name}
    db_password: ${module.pg_f_db.db_admin_pass}
    DOC
  filename = "../host_vars/tf_ansible_vars.yaml"
}
#create unfinished .env file
resource "local_file" "env" {
  content = <<-DOC
    # Host configuration
    PORT=8080
    HOST=0.0.0.0
    HOST_URL=http://${ module.lb.load_balancer_public_ip }:8080
    COOKIE_ENCRYPT_PWD=superAwesomePasswordStringThatIsAtLeast32CharactersLong!
    NODE_ENV=development

    # Okta configuration
    OKTA_ORG_URL=
    OKTA_CLIENT_ID=
    OKTA_CLIENT_SECRET=

    # Postgres configuration
    PGHOST=${module.pg_f_db.db_domain_server_name}
    PGUSERNAME=${module.pg_f_db.db_admin_name}
    PGDATABASE=postgres
    PGPASSWORD=${module.pg_f_db.db_admin_pass}
    PGPORT=5432
    DOC
  filename = "../.env"
}