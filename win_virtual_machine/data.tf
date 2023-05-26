data "azurerm_subnet" "db-subnet" {
  name                 = "db-subnet"
  virtual_network_name = "elite_win_vnet"
  resource_group_name  = "elite_network_rg"
}


# data "azurerm_network_security_group" "elitedev_nsg" {
#   name                = "elitedev_nsg"
#   resource_group_name = "elite_network_rg"
# }
