terraform {
  required_version = ">v0.13.0"
  required_providers {
    azurerm = {
      version = "~> 2.90.0"
      source  = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix_root}-rg"
  location = var.location
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_spaces      = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["web", "app", "db"]
  vnet_name           = "${var.prefix_root}-vnet"

  tags = {
    environment = "${var.prefix_root}"
    costcenter  = "it"
  }
  depends_on = [azurerm_resource_group.example]
}

module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple        = "UbuntuServer"
  vnet_subnet_id      = module.network.vnet_subnets[0]
  vm_size             = "Standard_B1ms"
  nb_instances        = 2
  nb_public_ip        = 2
  depends_on          = [module.network]
  vm_hostname         = "web"
  remote_port         = "22"
  admin_username      = "kien"
}
module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple        = "UbuntuServer"
  vnet_subnet_id      = module.network.vnet_subnets[0]
  vm_size             = "Standard_B1ms"
  nb_instances        = 2
  nb_public_ip        = 2
  depends_on          = [module.network]
  vm_hostname         = "app"
  remote_port         = "22"
  admin_username      = "kien"
}
