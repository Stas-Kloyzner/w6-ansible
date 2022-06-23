<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine_scale_set.scaleset](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_monitor_autoscale_setting.scaling-setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | scaleset admin password | `string` | `"superSECRETp@ssw0rd!"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | scaleset admin username | `string` | `"ssadmin"` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | number of scaleset instances | `number` | `1` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | scaleset ip configuration name | `string` | `"internal-ip"` | no |
| <a name="input_load_balancer_backend_address_pool_ids"></a> [load\_balancer\_backend\_address\_pool\_ids](#input\_load\_balancer\_backend\_address\_pool\_ids) | n/a | `any` | n/a | yes |
| <a name="input_load_balancer_inbound_nat_rules_ids"></a> [load\_balancer\_inbound\_nat\_rules\_ids](#input\_load\_balancer\_inbound\_nat\_rules\_ids) | n/a | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | type of machine to be provisioned for vmss | `string` | `"Standard_B1s"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | linux-vmss module variables | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_upgrade_mode"></a> [upgrade\_mode](#input\_upgrade\_mode) | scaleset upgrade mode | `string` | `"Automatic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_configuration_name"></a> [ip\_configuration\_name](#output\_ip\_configuration\_name) | n/a |
| <a name="output_network_interface_id"></a> [network\_interface\_id](#output\_network\_interface\_id) | n/a |
| <a name="output_network_interface_name"></a> [network\_interface\_name](#output\_network\_interface\_name) | n/a |
| <a name="output_scaleset_name"></a> [scaleset\_name](#output\_scaleset\_name) | linux-vmss module output |
| <a name="output_scaleset_password"></a> [scaleset\_password](#output\_scaleset\_password) | n/a |
| <a name="output_scaleset_username"></a> [scaleset\_username](#output\_scaleset\_username) | n/a |
<!-- END_TF_DOCS -->