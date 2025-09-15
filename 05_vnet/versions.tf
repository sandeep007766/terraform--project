terraform {
  required_version = "1.10.4"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.15.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "00681e52-1746-42b2-b0a5-ad83a3b482af"
}

