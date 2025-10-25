
resource "azurerm_virtual_network" "virual_network" {
  for_each            = var.virual_networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = [each.value.address_space]

  encryption {
    enforcement = lookup(each.value , "enforcement", "AllowUnencrypted") 
  }

#   dynamic "subnet" {
#     for_each = lookup(each.value, "subnets", {})
#     content {
#       name             = subnet.key
#       address_prefixes = [subnet.value.address_prefixes]
#     }

  dynamic "subnet" {
    for_each = lookup(each.value, "subnets", null) != null ? each.value.subnets : {}
    content {
      name             = subnet.key
      address_prefixes = [subnet.value.address_prefixes]
    }

  }

  tags = var.tags
}
