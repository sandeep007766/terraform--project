resource "azurerm_resource_group" "rg1" {
  name = "rg-1"
  location = "West US"
}

resource "random_string" "myrandom" {
  length = 16
  upper = false
  special = false
}

resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  # account_encryption_source = "Microsoft.Storage"
  tags = {
    environment = "staging"
  }
}
