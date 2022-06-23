# db module output
output "db_domain_server_name" {
  value = "${azurerm_postgresql_flexible_server.pgserver.name}.postgres.database.azure.com"
}
output "db_admin_name" {
  value = azurerm_postgresql_flexible_server.pgserver.administrator_login
}
output "db_admin_pass" {
  value = azurerm_postgresql_flexible_server.pgserver.administrator_password
}