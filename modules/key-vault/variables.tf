variable "name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault."
  type        = map(string)
  default     = {}
}   

