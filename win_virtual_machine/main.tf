resource "azurerm_resource_group" "elite_general_rg" {
  name     = var.elite_general_rg
  location = var.location
}

resource "azurerm_public_ip" "elitedev_pip" {
  name                = var.elitedev_pip
  resource_group_name = azurerm_resource_group.elite_general_rg.name
  location            = azurerm_resource_group.elite_general_rg.location
  allocation_method   = var.allocation_method

  tags = local.common_tags
}

resource "azurerm_network_interface" "elitedev_nic" {
  name                = var.elitedev_nic
  location            = azurerm_resource_group.elite_general_rg.location
  resource_group_name = azurerm_resource_group.elite_general_rg.name

  ip_configuration {
    name                          = var.ip_configuration
    subnet_id                     = data.azurerm_subnet.db-subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.elitedev_pip.id
  }
}


resource "azurerm_windows_virtual_machine" "windows-server" {
  name                = var.windows-server
  resource_group_name = azurerm_resource_group.elite_general_rg.name
  location            = azurerm_resource_group.elite_general_rg.location
  size                = "Standard_DS1_v2"
  admin_username      = join("", [local.admin_username, "admin"])
  admin_password      = azurerm_key_vault_secret.windows_server_password.value
  network_interface_ids = [
    azurerm_network_interface.elitedev_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}