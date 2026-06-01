# modules/aks/main.tf
# This module creates an AKS cluster with a system node pool

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  # System node pool - runs Kubernetes internal services
  default_node_pool {
    name                = "system"
    node_count          = var.node_count
    vm_size             = var.vm_size
    vnet_subnet_id      = var.subnet_id
    auto_scaling_enabled = var.auto_scaling_enabled
    min_count           = var.auto_scaling_enabled ? var.min_count : null
    max_count           = var.auto_scaling_enabled ? var.max_count : null

    upgrade_settings {
      max_surge = "10%"
    }
  }

  # Managed identity - Azure handles credentials automatically
  identity {
    type = "SystemAssigned"
  }

  # Network configuration - using Azure CNI for VNet integration
  network_profile {
    network_plugin = "azure"
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }
  
  tags = var.tags
}
