# Resource 2: VNet
resource "azurerm_virtual_network" "myvnet" {
  name = "myvnet-1"
  resource_group_name = azurerm_resource_group.myrg1.name
  location = azurerm_resource_group.myrg1.location
  address_space = [ "10.0.0.0/16" ]
  tags = { # argument of type map
    "Name" = "myvent01"
    # Comment and uncomment below line, when studying in-place updates
    "Environment" = "Dev" // add this after creating all the resources to check what update in-place resource behaviour means
  }
}

# Resource 3: Subnet
resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet01"
    resource_group_name = azurerm_resource_group.myrg1.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = [ "10.0.2.0/24" ]
}

# Resource 4: Create Public IP Address

/*
Public IP: used to enable internet-facing communication for Azure resources. 
It provides a publicly routable IP address that can be associated with resources like virtual machines, etc.
You cannot assign a public IP directly to a VNet but can attach it to resources within the VNet.
Resources = ["Virtual_Machines", "Bastion", "Azure Load Balancer", "Azure Application Gateway", "NAT Gateway", "VPN Gateway"] 
}
*/
resource "azurerm_public_ip" "mypublicip" {
    name                = "mypublicip01"
    resource_group_name = azurerm_resource_group.myrg1.name
    location            = azurerm_resource_group.myrg1.location
    allocation_method   = "Static"
    tags = {
      environment = "Dev"
    }
}

# Resource 5: Create Netwrok Interface

/*
It is a resource that enables an Azure Virtual Machine (VM) to communicate with the internet, Azure resources, and on-premises networks. 
It serves as the connection point between a VM and a Virtual Network (VNet).
Azure Network Interface is a critical component for enabling communication between VMs and other resources in Azure, as well as external networks. 
It provides flexibility in managing IP addresses, security, and advanced networking features.
*/

resource "azurerm_network_interface" "mynic" {
    name                = "mynic01"
    resource_group_name = azurerm_resource_group.myrg1.name
    location            = azurerm_resource_group.myrg1.location
    ip_configuration {
        name                          = "myipconfig01"
        subnet_id                     = azurerm_subnet.mysubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.mypublicip.id
    }
}
