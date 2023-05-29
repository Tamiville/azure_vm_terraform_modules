#############################################
###---------- Optional Variable ----------###

variable "vnet_rg" {
  description = "Name of the vnet resource_group"
  type        = string
}

variable "vnet_location" {
  description = "Name of the vnet location"
  type        = string
  default     = "null"
}

variable "vnet_name" {
  description = "Name of the virtual_network"
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network"
}

variable "dns_servers" {
  type = list(string)
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = []
}

variable "subnet_address_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = []
}

variable "nsg_ids" {
  description = "A map of subnet name to Network Security Group IDs"
  type        = map(string)
  default     = {}
}

variable "route_tables_ids" {
  description = "A map of subnet name to Route table ids"
  type        = map(string)
  default     = {}
}

#############################################
###-----------Required Variable-----------###

variable "address_prefix" {
  type    = string
  default = "10.0.0.0/16"
}

variable "next_hop_type" {
  type    = string
  default = "VnetLocal"
}