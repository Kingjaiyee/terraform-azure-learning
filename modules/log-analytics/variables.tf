variable "name" {
  type = string
  description = "The name of the Log Analytics workspace."
}

variable "location" {
  type = string
  description = "The location of the Log Analytics workspace."
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which to create the Log Analytics workspace."
}

variable "sku" {
  type = string
  description = "The SKU of the Log Analytics workspace. Valid values are 'PerGB2018' and 'Free'."
  default = "PerGB2018"
}       

variable "retention_in_days" {
  type = number
  description = "The retention period for the Log Analytics workspace in days."
  default = 30
}   

variable "tags" {
  type = map(string)
  description = "A map of tags to assign to the Log Analytics workspace."
  default = {}
}