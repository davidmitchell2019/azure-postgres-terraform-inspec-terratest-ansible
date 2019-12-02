variable "database-login" {
  type = "string"
}
variable "database-password" {
  type = "string"
}
#Resource group name to add inside of a subscription
variable "resource_group_name"{
  type = "string"
}
#Storage account name to hold containers
variable "storage_account_name"{
  type = "string"
}
#Storage container name for blob storage
variable "storage_container_name"{
  type = "string"
}
#Name of the server
variable "postgres-server-name"{
  type = "string"
}
#virtual network ip address and cidr, eg 10.10.10.0/24
variable "vnet_ip_cidr" {
  type = "string"
}
#Subnet ip and cidr address, eg 10.10.10.0/24
variable "subnet_ip_cidr" {
  type = "string"
}
#Ip address for Azure Postgres firewall, in house Ip address that connects into the Express route
variable "office_ip" {
  type = "string"
}
#Database storage in megabytes
variable "storagemb" {
  type ="string"
}
#number of days to retain backups
variable "backup_retention_days" {
  type = "string"
}
#enable geo redundency for Azure postgres
variable "geo_redundent_enabled" {
  type = "string"
}