##########################################
########### Optional Variables ###########

variable "db_rg" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_acc" {
  type = string
}

variable "sqlserver" {
  type = string
}

variable "sql_user_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "firewallruledatabase" {
  type = string
}

variable "start_ip_address" {
  type = string
}

variable "end_ip_address" {
  type = string
}

########## key_vault ############
variable "key-vault" {
  type = string
}

variable "sql_server_password" {
  type = string
}


###########################################
############ Required Variables ###########

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "sqlversion" {
  type    = string
  default = "12.0"
}

variable "license_type" {
  type    = string
  default = "LicenseIncluded"
}

variable "collation" {
  type    = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}

variable "read_scale" {
  type    = bool
  default = false
}

variable "zone_redundant" {
  type    = bool
  default = false
}

########### KeyVault ############

variable "enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "purge_protection_enabled" {
  type    = bool
  default = false
}

variable "vault_sku_name" {
  type    = string
  default = "standard"
}