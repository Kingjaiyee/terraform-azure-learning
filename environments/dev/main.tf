# environments/dev/main.tf
module "resource_group" {
  source   = "../../modules/resource-group"

  name     = "rg-dev-terraform-learning"
  location = "eastus"

  tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
  }
}

module "storage_account" {
  source   = "../../modules/storage-account"

  storage_account_name = "stterraformlearningdev"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  account_tier         = "Standard"
  account_replication_type = "LRS"

  container_name       = "tfstate"

  tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
    day         = "3"
  }
}

module "vnet" {
  source   = "../../modules/vnet"

  vnet_name           = "vnet-dev-terraform-learning"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = "10.0.0.0/16"

  subnets = {
    "aks-subnet" = {
      address_prefix = "10.0.1.0/24"
      security_rules = [
        {
          name                       = "allow-https-inbound"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "443"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        },
        {
          name                       = "allow-kubelet-from-vnet"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "10250"
          source_address_prefix      = "VirtualNetwork"
          destination_address_prefix = "*"
        },
        {
          name                       = "deny-all-inbound-internet"
          priority                   = 4000
          direction                  = "Inbound"
          access                     = "Deny"
          protocol                   = "*"
          source_port_range          = "*"
          destination_port_range     = "*"
          source_address_prefix      = "Internet"
          destination_address_prefix = "*"
        }
      ]
    }
    "appgw-subnet" = {
      address_prefix = "10.0.2.0/24"
    }
    "default" = {
      address_prefix = "10.0.3.0/24"
    }
  }

  tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
  }
}


module "aks" {
  source   = "../../modules/aks"

  cluster_name        = "aks-dev-terraform-learning"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  log_analytics_workspace_id = module.log_analytics.id
  dns_prefix          = "aksdevterraformlearning"
  node_count          = 2
  vm_size             = "Standard_B2s"
  auto_scaling_enabled = false
  min_count           = 1
  max_count           = 3
  subnet_id           = module.vnet.subnet_ids["aks-subnet"]
  service_cidr        = "10.1.0.0/16"

  tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
  }
}

module "log_analytics" {
  source   = "../../modules/log-analytics"

  name                = "law-dev-terraform-learning"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
  }
}


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