
resource "azurerm_virtual_network" "vnet_name" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet_rg.name
  location            = var.vnet_location != null ? var.vnet_location : data.azurerm_resource_group.vnet_rg.location
  address_space = var.address_space
  dns_servers   = var.dns_servers
  tags          = local.network_tags
}


resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = data.azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
}


resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
  for_each                  = var.nsg_ids 
  subnet_id                 = local.azurerm_subnets[each.key]
  network_security_group_id = each.value
}

resource "azurerm_subnet_route_table_association" "rtb_assoc" {
  for_each       = var.route_tables_ids 
  route_table_id = each.value
  subnet_id      = local.azurerm_subnets[each.key]
}