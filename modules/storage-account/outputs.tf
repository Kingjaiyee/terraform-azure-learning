output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.this.name
  
}

output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.this.id
}

output "storage_container_name" {
  description = "The name of the Storage Container"
  value       = azurerm_storage_container.this.name
}

output "primary_access_key" {
  description = "The primary access key of the Storage Account"
  value       = azurerm_storage_account.this
  sensitive   = true
}