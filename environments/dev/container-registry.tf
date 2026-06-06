module "container_registry" {
  source              = "../../modules/acr"
  name                = "acrdevtflearn"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku                 = "Basic"
 tags = {
    environment = "dev"
    project     = "terraform-learning"
    managed_by  = "terraform"
  }
}