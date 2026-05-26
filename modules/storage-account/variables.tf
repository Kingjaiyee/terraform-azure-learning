variable "storage_account_name" {
  description = "name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "name of the resource group"
  type        = string
}

variable "location" {
  description = "location of the storage account"
  type        = string
  
}

variable "account_tier" {
  description = "performance tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "container_name" { 
  description = "name of the storage container"
  type        = string
  default     = "tfstate"
}


variable "tags" {
  description = "tags of the storage account"
  type        = map(string)
  default     = {}
}