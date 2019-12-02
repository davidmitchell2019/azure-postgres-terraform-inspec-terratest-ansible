variable "database-login" {
  type = "string"
  default = "adminuser1234"
}
variable "database-password" {
  type = "string"
  default = "Liverpool1Liverpool1"
}
#Resource group name to add inside of a subscription
variable "resource_group_name"{
  type = "string"
  default = "postgres-sql"
}
#Storage account name to hold containers
variable "storage_account_name"{
  type = "string"
  default = "postgressqlsa"
}
#Storage container name for blob storage
variable "storage_container_name"{
  type = "string"
  default = "storagecontainer"
}
#Name of the server
variable "postgres-server-name"{
  type = "string"
  default = "postgres-server-test-1234"
}
#virtual network ip address and cidr, eg 10.10.10.0/24
variable "vnet_ip_cidr" {
  type = "string"
  default = "10.10.10.0/24"
}
#Subnet ip and cidr address, eg 10.10.10.0/24
variable "subnet_ip_cidr" {
  type = "string"
  default = "10.10.10.0/24"
}
#Ip address for Azure Postgres firewall, in house Ip address that connects into the Express route
variable "office_ip" {
  type = "string"
  default = "79.66.41.57"
}
#Database storage in megabytes
variable "storagemb" {
  type ="string"
  default = "5120"
}
#number of days to retain backups
variable "backup_retention_days" {
  type = "string"
  default = "7"
}
#enable geo redundency for Azure postgres
variable "geo_redundent_enabled" {
  type = "string"
  default = "Enabled"
}