resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
}

resource "azurerm_resource_group" "myrg" {
  name = "${local.resource_name_prefix}-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags = local.common_tags
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${local.resource_name_prefix}-${var.vnet_name}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = local.common_tags
}
