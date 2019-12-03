#All variable descriptions can be found in the root modules variables file
variable "database-login"{
  type  = "string"
}
variable "database-password"{
  type = "string"
}
variable "resource_group_name" {
  type = "string"
}
variable "postgres-server-name"{
  type = "string"
}
variable "vnet_ip_cidr" {
  type = "string"
}
variable "subnet_ip_cidr" {
  type = "string"
}
variable "office_ip" {
  type = "string"
}
variable "storagemb" {
  type = "string"
}
variable "backup_retention_days" {
  type = "string"
}
variable "geo_redundent_enabled" {
  type = "string"
}