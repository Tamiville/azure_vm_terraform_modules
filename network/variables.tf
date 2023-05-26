variable "elite_network_rg" {
  type    = string
  default = "elite_network_rg"
}

variable "location" {
  type    = string
  default = "North Europe"
}

variable "elite_win_vnet" {
  type    = string
  default = "elite_win_vnet"
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "dns_servers" {
  type    = list(string)
  default = ["10.0.0.4", "10.0.0.5"]
}

# variable "dns_servers" {
#   type        = list(string)
#   default = ["10.0.0.4", "10.0.0.5"]
# }

variable "db-subnet" {
  type    = string
  default = "db-subnet"
}

variable "address_prefixes" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "app-subnet" {
  type    = string
  default = "app-subnet"
}

variable "address_prefixes2" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}

variable "source_address_prefix" {
  type    = string
  default = "84.232.141.74"
}

variable "destination_address_prefix" {
  type    = string
  default = "VirtualNetwork"
}

variable "elitedev_nsg" {
  type    = string
  default = "elitedev_nsg"
}