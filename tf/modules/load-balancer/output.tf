#load balancer module  output
output "load_balancer_backend_address_pool_ids" {
  value = [ azurerm_lb_backend_address_pool.lb-be-pool.id ]
}
output "load_balancer_inbound_nat_rules_ids" {
  value = [ azurerm_lb_nat_pool.lb-NAT-pool.id ]
}
output "load_balancer_public_ip" {
  value = azurerm_public_ip.lb-ip.ip_address
}
output "load_balancer_name" {
  value = azurerm_lb.lb.name
}
