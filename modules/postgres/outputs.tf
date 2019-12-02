output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = "${azurerm_postgresql_server.postgres-server.fqdn}"
}
output "username" {
  value = "${azurerm_postgresql_server.postgres-server.administrator_login}"
}
output "password" {
  value = "${azurerm_postgresql_server.postgres-server.administrator_login_password}"
}
output "dbname" {
  value = "${azurerm_postgresql_database.postgres-db.name}"
}