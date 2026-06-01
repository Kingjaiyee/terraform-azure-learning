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












