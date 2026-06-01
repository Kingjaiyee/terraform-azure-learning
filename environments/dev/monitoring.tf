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