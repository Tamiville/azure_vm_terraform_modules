terraform {
  backend "azurerm" {
    resource_group_name  = "elite_storage_rg"
    storage_account_name = "elitestorageaccount"
    container_name       = "elitestoragecontainer"
    key                  = "server.terraform.tfstate"
  }
}