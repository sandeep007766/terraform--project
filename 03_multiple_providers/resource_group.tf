resource "azurerm_resource_group" "myrg1" {
  name = "myrg-01"
  location = "East US"
}

resource "azurerm_resource_group" "myrg2" {
  name = "myrg-02"
  location = "West US"
  provider = azurerm.provider2_westus
}
