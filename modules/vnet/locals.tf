locals {
  azurerm_subnets = {
    for index, subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }

  # Common tags to be assigned to all resources
  network_tags = {
    Service     = "DevOps"
    Owner       = "Tamie-Emmanuel"
    Company     = "Elitesolutionsit"
    environment = "Development"
    ManagedWith = "terraform"
  }
}
