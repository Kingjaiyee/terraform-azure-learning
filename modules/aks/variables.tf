variable   "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable   "location" {
  description = "The Azure region where the AKS cluster will be created."
  type        = string
}

variable   "resource_group_name" {
  description = "The name of the resource group where the AKS cluster will be created."
  type        = string
}   

variable   "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable   "node_count" {
  description = "The number of nodes in the default node pool."
  type        = number
  default     = 2
}

variable   "vm_size" {
  description = "The size of the VMs in the default node pool."
  type        = string
  default     = "Standard_B2s"
}

variable   "auto_scaling_enabled" {
  description = "Whether to enable auto-scaling for the default node pool."
  type        = bool
  default     = false
}

variable   "min_count" {
  description = "The minimum number of nodes when auto-scaling is enabled."
  type        = number
  default     = 1
}

variable   "max_count" {
  description = "The maximum number of nodes when auto-scaling is enabled."
  type        = number
  default     = 3
}

variable   "subnet_id" {
  description = "The ID of the subnet where the AKS cluster will be deployed."
  type        = string
}

variable   "service_cidr" {
  description = "The CIDR block for the Kubernetes service network."
  type        = string
  default     = "10.1.0.0/16"
}

variable   "dns_service_ip" {
  description = "The IP address within the service CIDR to assign to the Kubernetes DNS service."
  type        = string
  default     = "10.1.0.10"
}           


variable   "tags" {
  description = "A map of tags to assign to the AKS cluster."
  type        = map(string)
  default     = {}
}