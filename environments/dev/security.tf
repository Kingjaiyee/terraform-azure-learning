module "key_vault" {
  source   = "../../modules/key-vault"

  name                = "kv-dev-tflearn"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
  }
}



# Role assignment: AKS managed identity can manage networking in the VNet
resource "azurerm_role_assignment" "aks_network_contributor" {
  scope                = module.vnet.id
  role_definition_name = "Network Contributor"
  principal_id         = module.aks.principal_id
}

# Role assignment: AKS managed identity can read secrets from Key Vault
resource "azurerm_role_assignment" "aks_keyvault_secrets_user" {
  scope                = module.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.aks.principal_id
}