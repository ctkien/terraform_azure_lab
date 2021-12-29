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
  }
  depends_on = [azurerm_resource_group.example]
}

module "linuxservers" {
  source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  vm_os_simple        = "UbuntuServer"
  for_each            = var.vm
  vnet_subnet_id      = module.network.vnet_subnets["${each.value.snet}"]
  vm_size             = each.value.vm_size
  nb_instances        = each.value.instance
  nb_public_ip        = each.value.instance
  vm_hostname         = each.value.vm_hostname
  remote_port         = each.value.remote_port
  admin_username      = each.value.admin_username

  depends_on = [module.network]
}


output "vnet_contain" {
  value = contains(module.network.vnet_subnets[*], "web")
}
output "public_ip" {
  value = module.linuxservers["web"].public_ip_address
}
