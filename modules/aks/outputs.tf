output "name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "kube_config_raw" {
  description = "The raw Kubernetes config for kubectl access."
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}

output "principal_id" {
  description = "The principal ID of the cluster's managed identity."
  value       = azurerm_kubernetes_cluster.this.identity[0].principal_id
}