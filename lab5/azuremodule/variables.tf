variable "prefix_root" {
  default = "dev"
}
variable "location" {
  default = "southeastasia"
}


locals {
  subnet = {
    web = {
      vnet_name       = "${var.prefix_root}-vnet"
      address_spaces  = ["10.0.0.0/16"]
      subnet_prefixes = ["10.0.0.0/24"]
      tags = {
        environment = "${var.prefix_root}"
      }
    }
    app = {
      vnet_name       = "${var.prefix_root}-vnet"
      address_spaces  = ["10.0.0.0/16"]
      subnet_prefixes = ["10.0.1.0/24"]
      tags = {
        environment = "${var.prefix_root}"
      }
    }
  }
}
