module "database" {

  source               = "./database/"
  db_rg                = join("_", ["elite", "general", "rg"])
  location             = upper("North Europe")
  storage_acc          = "elitestorageaccount"
  sqlserver            = join("", ["elite", "mssql", "server"])
  sql_user_name        = join("", ["elite", "mssqladmin"])
  database_name        = join("_", ["elitedev", "database"])
  firewallruledatabase = join("", ["firewallrule", "database"])
  start_ip_address     = "84.232.141.74"
  end_ip_address       = "84.232.141.74"

  ####### creating Keyvault ##########
  key-vault           = "elite-keyvault"
  sql_server_password = upper("msqlpassword")
}



module "virtualnetwork" {
  source = "./vnet/"

  vnet_rg                 = join("_", ["elite", "vnet", "rg"])
  vnet_name               = join("_", ["elite", "vnet"])
  address_space           = ["10.0.0.0/16"]
  dns_servers             = ["10.0.0.4", "10.0.0.5"]
  subnet_names            = ["application", "database", "servers"]
  subnet_address_prefixes = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

  route_tables_ids = {
    application = azurerm_route_table.rtb.id
    database    = azurerm_route_table.rtb.id
    servers     = azurerm_route_table.rtb.id 
  }
  nsg_ids = {
    application = azurerm_network_security_group.nsg.id
    database    = azurerm_network_security_group.nsg.id
    servers     = azurerm_network_security_group.nsg.id
  }
}
