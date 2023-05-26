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