resource_groups = {
  rg1 = {
    name     = "myRG1"
    location = "East US"
  }
  rg2 = {
    name     = "myRG2"
    location = "West US"
  }
}

virual_networks = {
  vnet1 = {
    name                = "myVNet1"
    location            = "East US"
    resource_group_name = "myRG1"
    address_space       = "10.0.0.0/16"
    enforcement         = "AllowUnencrypted"
    subnets = {
      subnet1 = {
        address_prefixes = "10.0.1.0/24"
      }
      subnet2 = {
        address_prefixes = "10.0.2.0/24"
      }
    }
  }
  vnet2 = {
    name                = "myVNet2"
    location            = "West US"
    resource_group_name = "myRG2"
    address_space       = "10.0.0.0/16"
  }
}
