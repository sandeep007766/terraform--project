terraform {
  required_version = "1.10.4"
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        # version = "4.1.0" Try with this version first for creting resources and then try with new version
        version = "4.15.0" # Without - upgrade option for init command we will not be able to uprade to this version of provider in lock.hcl file
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {} 
  subscription_id = "00681e52-1746-42b2-b0a5-ad83a3b482af"
}
