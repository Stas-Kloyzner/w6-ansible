<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0.2 |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_Vnet"></a> [Vnet](#module\_Vnet) | ./modules/network | n/a |
| <a name="module_lb"></a> [lb](#module\_lb) | ./modules/load-balancer | n/a |
| <a name="module_pg_f_db"></a> [pg\_f\_db](#module\_pg\_f\_db) | ./modules/db | n/a |
| <a name="module_vm_scale_set"></a> [vm\_scale\_set](#module\_vm\_scale\_set) | ./modules/linux-vmss | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [local_file.env](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.tf_ansible_vars_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [http_http.ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_administrator_login"></a> [db\_administrator\_login](#input\_db\_administrator\_login) | db administrator username | `string` | `"pgadmin"` | no |
| <a name="input_db_administrator_password"></a> [db\_administrator\_password](#input\_db\_administrator\_password) | db administrator password | `string` | `"p@sSw0rD"` | no |
| <a name="input_db_zone"></a> [db\_zone](#input\_db\_zone) | db zone | `number` | `1` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | the name of the workspace, resource group and all components will be named based on it | `string` | `"staging"` | no |
| <a name="input_location"></a> [location](#input\_location) | location of the resource group | `string` | `"eastus"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | type of machine to be provisioned for vmss | `string` | `"Standard_B1s"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | pg flexible server storage size in mb | `number` | `32768` | no |
| <a name="input_vmss_admin_password"></a> [vmss\_admin\_password](#input\_vmss\_admin\_password) | vmss admin password | `string` | `"ad@M12345678"` | no |
| <a name="input_vmss_admin_username"></a> [vmss\_admin\_username](#input\_vmss\_admin\_username) | vmss admin username | `string` | `"vmssadmin"` | no |
| <a name="input_vmss_instances"></a> [vmss\_instances](#input\_vmss\_instances) | default number of vmss machines | `number` | `1` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | vnet address space | `string` | `"10.0.0.0"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->