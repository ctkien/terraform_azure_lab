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


data "azurerm_platform_image" "example" {
  location  = "Southeast Asia"
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"
}

output "image_id" {
  value = data.azurerm_platform_image.example.id
}

data "azurerm_resource_group" "example" {
  name = "remotestate"
}

output "rg_id" {
  value = data.azurerm_resource_group.example.id
}

data "local_file" "script" {
  filename = "./a.sh"
}
output "script" {
  value = data.local_file.script.content
}
