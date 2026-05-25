output "resource_group_name" {
  description = "name of the resource group"
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "location of the resource group"
  value       = module.resource_group.location
}

output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.resource_group.id
}