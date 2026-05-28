output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "id" {
  description = "The ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "location" {
  description = "The location of the virtual network."
  value       = azurerm_virtual_network.this.location
}

output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_virtual_network.this.resource_group_name
}

output "subnet_ids" {
  description = "A map of subnet names to their IDs."
  value       = { for name, subnet in azurerm_subnet.this : name => subnet.id }
}

output "nsg_ids" {
  description = "A map of NSG names to their IDs."
  value       = { for name, nsg in azurerm_network_security_group.this : name => nsg.id }
}