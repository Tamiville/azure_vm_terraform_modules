#####################################################
################## DataBase Module ##################
resource "azurerm_resource_group" "db_rg" {
  name     = var.db_rg
  location = var.location
}

resource "azurerm_storage_account" "storage_acc" {
  name                     = var.storage_acc
  resource_group_name      = azurerm_resource_group.db_rg.name
  location                 = azurerm_resource_group.db_rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sqlserver
  resource_group_name          = azurerm_resource_group.db_rg.name
  location                     = azurerm_resource_group.db_rg.location
  version                      = var.sqlversion
  administrator_login          = var.sql_user_name
  administrator_login_password = azurerm_key_vault_secret.sql_server_password.value
}

resource "azurerm_mssql_database" "database" {
  name           = var.database_name
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = var.collation
  license_type   = var.license_type
  read_scale     = var.read_scale
  zone_redundant = var.zone_redundant
  tags           = local.database_tags
}

resource "azurerm_mssql_firewall_rule" "firewallruledatabase" {
  name             = var.firewallruledatabase
  server_id        = azurerm_mssql_server.sqlserver.id
  start_ip_address = var.start_ip_address
  end_ip_address   = length(var.end_ip_address) == 0 ? var.start_ip_address : var.end_ip_address
}

#########################################################
################## Creating Key-Vault ###################

resource "azurerm_key_vault" "key-vault" {
  provider                    = azurerm.vault
  name                        = var.key-vault
  location                    = azurerm_resource_group.db_rg.location
  resource_group_name         = var.db_rg != null ? var.db_rg : azurerm_resource_group.db_rg.name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.vault_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List"
    ]

    secret_permissions = [
      "Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set",
    ]

    storage_permissions = [
      "Get", "List"
    ]
  }
}

##### Generating Random characters for KeyVault password #####
resource "random_password" "sql_server_password" {
  length  = 20
  special = true
}

########## Create Key_Vault Secret for sql database ##########

resource "azurerm_key_vault_secret" "sql_server_password" {
  name         = var.sql_server_password
  value        = random_password.sql_server_password.result
  key_vault_id = azurerm_key_vault.key-vault.id

  depends_on = [azurerm_key_vault.key-vault]
}