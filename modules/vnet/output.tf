output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet_name.id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet_name.name
}

output "location" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet_name.location
}

output "subnet_address_prefixes" { 
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet_name.address_space
}

output "subnet_names" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet.*.id
}