terraform {
  required_version = ">v0.13.0"
  required_providers {
    azurerm = {
      version = "~> 2.90.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "remotestate"
    storage_account_name = "itforvnremotestate"
    container_name       = "statefiles"
    key                  = "dev-network.state"
  }
}
provider "azurerm" {
  features {}
}
module "base_network" {
  source   = "../../module/base_network"
  prefix   = var.prefix_root
  location = var.location
}
variable "prefix_root" {
  default = "dev"
}

variable "location" {
  default = "southeastasia"
}
