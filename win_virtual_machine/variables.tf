variable "elite_general_rg" {
  type    = string
  default = "elite_general_rg"
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "allocation_method" {
  type    = string
  default = "Static"
}

variable "elitedev_pip" {
  type    = string
  default = "elitedev_pip"
}

variable "elitedev_nic" {
  type    = string
  default = "elitedev_nic"
}

variable "ip_configuration" {
  type    = string
  default = "internal"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "windows-server" {
  type    = string
  default = "win-server-dev"
}

variable "app-subnet" {
  type    = string
  default = "app-subnet"
}

variable "address_prefixes2" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}

################ STORAGE ACCOUNT ################
variable "storage-rg" {
  type    = string
  default = "elite_storage_rg"
}

variable "storage-acc" {
  type    = string
  default = "elitestorageaccount"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "GRS"
}

variable "storage_container" {
  type    = string
  default = "elitestoragecontainer"
}

variable "container_access_type" {
  type    = string
  default = "private"
}

# ############## Backend-state.tf ##################
# variable "backend-state-key" {
#   type    = string
#   default = "server.terraform.tfstate"
# }
