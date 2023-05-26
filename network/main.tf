resource "azurerm_resource_group" "elite_network_rg" {
  name     = var.elite_network_rg
  location = var.location
}

resource "azurerm_virtual_network" "elite_win_vnet" {
  name                = var.elite_win_vnet
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  location            = azurerm_resource_group.elite_network_rg.location
  resource_group_name = azurerm_resource_group.elite_network_rg.name
}

resource "azurerm_network_security_group" "elitedev_nsg" {
  name                = var.elitedev_nsg
  location            = azurerm_resource_group.elite_network_rg.location
  resource_group_name = azurerm_resource_group.elite_network_rg.name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "*"
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = var.destination_address_prefix
  }

  tags = local.common_tags
}

resource "azurerm_subnet" "db-subnet" {
  name                 = var.db-subnet
  resource_group_name  = azurerm_resource_group.elite_network_rg.name
  virtual_network_name = azurerm_virtual_network.elite_win_vnet.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_subnet" "app-subnet" {
  name                 = var.app-subnet
  resource_group_name  = azurerm_resource_group.elite_network_rg.name
  virtual_network_name = azurerm_virtual_network.elite_win_vnet.name
  address_prefixes     = var.address_prefixes2
}
