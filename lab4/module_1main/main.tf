terraform {
  required_version = ">v0.13.0"
  required_providers {
    azurerm = {
      version = "~> 2.90.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
  }
}
provider "azurerm" {
  features {}
}
module "base_network" {
  source   = "./module/base_network"
  prefix   = var.prefix_root
  location = var.location
}
