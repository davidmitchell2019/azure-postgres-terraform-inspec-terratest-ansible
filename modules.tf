#Call the module from the modules folder
module "postgres" {
  source  = "./modules/postgres"
  database-login = "${var.database-login}"
  database-password = "${var.database-password}"
  postgres-server-name = "${var.postgres-server-name}"
  resource_group_name = "${var.resource_group_name}"
  office_ip = "${var.office_ip}"
  subnet_ip_cidr = "${var.subnet_ip_cidr}"
  vnet_ip_cidr = "${var.vnet_ip_cidr}"
  storagemb = "${var.storagemb}"
  backup_retention_days = "${var.backup_retention_days}"
  geo_redundent_enabled = "${var.geo_redundent_enabled}"
}
