output "name" {
  value = azurerm_log_analytics_workspace.this.name
  description = "The name of the Log Analytics workspace."
}

output "location" {
  value = azurerm_log_analytics_workspace.this.location
  description = "The location of the Log Analytics workspace."
}

output "resource_group_name" {
  value = azurerm_log_analytics_workspace.this.resource_group_name
  description = "The name of the resource group in which the Log Analytics workspace was created."
}


output "id" {      
  value = azurerm_log_analytics_workspace.this.id
  description = "The ID of the Log Analytics workspace."
}
