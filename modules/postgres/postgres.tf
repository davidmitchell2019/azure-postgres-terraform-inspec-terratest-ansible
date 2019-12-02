#Create a Postgres server
resource "azurerm_postgresql_server" "postgres-server" {
  name                         = "postgres-server-test-1234"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "UK South"
  version                      = "10.0"
  administrator_login          = "${var.database-login}"
  administrator_login_password = "${var.database-password}"
  ssl_enforcement              = "Disabled"
  sku {
   name     = "GP_Gen5_2"
   capacity = 2
   tier     = "GeneralPurpose"
   family   = "Gen5"
  }
  storage_profile {
    storage_mb            = "${var.storagemb}"
    backup_retention_days = "${var.backup_retention_days}"
    geo_redundant_backup  = "${var.geo_redundent_enabled}"
  }
}
#Add a test database to the server for terratest
resource "azurerm_postgresql_database" "postgres-db" {
  name                = "test"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_postgresql_server.postgres-server.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
#Create a Postgres firewall rule, that allows the office IP to connect to the database
resource "azurerm_postgresql_firewall_rule" "fw" {
  name                = "office-ip"
  resource_group_name = "${var.resource_group_name}"
  server_name         = "${azurerm_postgresql_server.postgres-server.name}"
  start_ip_address    = "${var.office_ip}"
  end_ip_address      = "${var.office_ip}"
  depends_on = [azurerm_postgresql_database.postgres-db]
}