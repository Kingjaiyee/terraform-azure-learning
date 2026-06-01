variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}


variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group where the VNet will be created."
  type        = string
}


variable "address_space" {
  description = "The address space for the virtual network."
  type        = string
}

variable "subnets" {
  description = "A map of subnet names to their configuration including address prefix and security rules."
  type = map(object({
    address_prefix = string
    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })), [])
  }))
}

variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
  default     = {}
}