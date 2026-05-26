# environments/dev/providers.tf
terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "rg-dev-terraform-learning"
    storage_account_name = "stterraformlearningdev"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "2329876a-dd1e-4d17-9d7e-6504024dd500"
}