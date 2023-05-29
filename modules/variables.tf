############# resources-for-vnet ##############

variable "vnet_rg" {
  type        = string
  default     = "elite_vnet_rg"
}

variable "location" {
  type        = string
  default     = "North Europe"
}

variable "nsg" {
  type        = string
  default     = "elite_nsg"
}

variable "rtb" {
  type        = string
  default     = "elite_rtb"
}

variable "address_prefix" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "next_hop_type" {
  type        = string
  default     = "VnetLocal"
}
################ end-for-vnet #################