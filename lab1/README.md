Azure login with cli
```
Az login
```
Set Azure subscription with output from ```Az login``` fields id
```
Az account set -s "xxxxxxx-xxxx-xxxxx-xxxxxxxxxxxx"
```
Terraform init to initialize the workspace.
```
terraform init
```

Requirements:
_Add public ip to the VM
_Add data disk to the VM

Reference 
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment