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

