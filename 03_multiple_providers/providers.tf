terraform { 
  required_version = "1.10.4"
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = ">=4.15.0"
    }
  }
}

# Default provider
provider "azurerm" {
  features {}
}

# Alternative Provider for West US Location
provider "azurerm" {
  features {
    virtual_machine_scale_set {
    scale_to_zero_before_deletion = true
    }
    virtual_machine {
        graceful_shutdown = false
    }
  }
  alias = "provider2_westus"
  # subscription_id = "your_subscription_id"
  # client_id = "your_client_id"
  # client_secret = "your_client_secret"
}
