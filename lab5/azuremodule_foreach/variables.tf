variable "prefix_root" {
  default = "dev"
}
variable "location" {
  default = "southeastasia"
}

variable "vm" {
  default = {
    web = {
      vm_size        = "Standard_B1ms"
      instance       = 2
      vm_hostname    = "web-frontend"
      remote_port    = "22"
      admin_username = "kien"
      vm_hostname    = "dev-web-vm"
      snet           = 0
    },
    app = {
      vm_size        = "Standard_B1ms"
      instance       = 1
      vm_hostname    = "app-abc"
      remote_port    = "22"
      admin_username = "kien"
      vm_hostname    = "dev-app-vm"
      snet           = 1
    },
    db = {
      vm_size        = "Standard_B1ms"
      instance       = 1
      vm_hostname    = "app-abc"
      remote_port    = "22"
      admin_username = "kien"
      vm_hostname    = "dev-db-vm"
      snet           = 2
    }
  }
}
