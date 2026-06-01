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
