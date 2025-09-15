terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.15.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

# Create resource group
resource "azurerm_resource_group" "my_rg1" {
    location = "eastus"
    name = "my_rg1"
}
