locals {
  common_tags = {
    environment = "dev"
  }
}


module "resource_group" {
  source          = "../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
  tags            = local.common_tags
}

module "virual_network" {
  source          = "../modules/azurerm_virtual_network"
  virual_networks = var.virual_networks
  tags            = local.common_tags
  depends_on      = [module.resource_group]
}
