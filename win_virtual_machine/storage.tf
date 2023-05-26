resource "azurerm_resource_group" "storage-rg" {
  name     = var.storage-rg
  location = var.location
}

resource "azurerm_storage_account" "storage-acc" {
  name                     = var.storage-acc
  resource_group_name      = azurerm_resource_group.storage-rg.name
  location                 = azurerm_resource_group.storage-rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = local.common_tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container
  storage_account_name  = azurerm_storage_account.storage-acc.name
  container_access_type = var.container_access_type
}