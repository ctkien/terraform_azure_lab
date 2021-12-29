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
  name     = "${var.prefix}-rg"
  location = var.location
}
resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  for_each             = var.subnet
  name                 = "${var.prefix}-${each.key}-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["${each.value.prefix}"]
}
variable "prefix" {
  description = "resource prefix"
  default     = "terraform"
}
variable "location" {
  default = "southeastasia"
}
variable "subnet" {
  type = map(any)
  default = {
    "web" = {
      prefix = "10.0.1.0/24"
    },
    "app" = {
      prefix = "10.0.2.0/24"
    },
    "db" = {
      prefix = "10.0.3.0/24"
    }
  }
}
