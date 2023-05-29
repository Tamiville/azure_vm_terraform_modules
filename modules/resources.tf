########################## resources-for-vnet ###########################

resource "azurerm_resource_group" "vnet_rg" {
  name     = var.vnet_rg
  location = var.location
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
}

resource "azurerm_route_table" "rtb" {
  name                = var.rtb
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
}

resource "azurerm_route" "route" {
  name                = "route1"
  resource_group_name = azurerm_resource_group.vnet_rg.name
  route_table_name    = azurerm_route_table.rtb.name
  address_prefix      = var.address_prefix 
  next_hop_type       = var.next_hop_type 
}

############################## end-of-vnet ################################