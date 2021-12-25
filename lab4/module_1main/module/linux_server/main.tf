terraform {
  required_version = ">v0.13.0"
  required_providers {
    azurerm = {
      version = "~> 2.90.0"
      source  = "hashicorp/azurerm"
    }
  }
}

resource "azurerm_network_interface" "example" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = data.azurerm_resource_group.example.name
  location                        = var.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "random_password.password[0].result"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

data "azurerm_resource_group" "example" {
  name = "${var.prefix}-resources"
}


data "azurerm_subnet" "example" {
  name                 = "${var.prefix}-subnet"
  virtual_network_name = "${var.prefix}-network"
  resource_group_name  = "${var.prefix}-resources"
}

