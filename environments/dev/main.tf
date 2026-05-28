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
    }
    "appgw-subnet" = {
      address_prefix = "10.0.2.0/24"
    }
    "default" = {
      address_prefix = "10.0.3.0/24"
    }
  }
}