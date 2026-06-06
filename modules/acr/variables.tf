variable   "name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "location" {
  description = "The Azure region where the Container Registry will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry."
  type        = string
}

variable "sku" {
  description = "The SKU of the Container Registry. Valid values are 'Basic', 'Standard', and 'Premium'."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "A map of tags to assign to the Container Registry."
  type        = map(string)
  default     = {}
}  


