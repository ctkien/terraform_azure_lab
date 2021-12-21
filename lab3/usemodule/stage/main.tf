terraform {
  required_version = ">v0.13.0"
  required_providers {
    azurerm = {
      version = "~> 2.36.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "remotestate"
    storage_account_name = "itforvnremotestate"
    container_name       = "statefiles"
    key                  = "stage.state"
  }
}
provider "azurerm" {
  features {}
}
module "linux_server" {
  source = "../module"
  prefix = var.prefix_root
}

variable "prefix_root" {
  default = "stage"
}

output "ipadress" {
  value = module.linux_server.private_ip
}
