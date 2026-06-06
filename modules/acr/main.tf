# modules/acr/main.tf
# This module creates an Azure Container Registry

resource "azurerm_container_registry" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  # Security best practices
  admin_enabled = true

  tags = var.tags
}