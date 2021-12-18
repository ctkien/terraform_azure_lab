Requirements: <br />
- Create 3 directory with 3 environment: dev, staging, prod <br />
- Create requirement to save terraform state in blob storage account. Enable versioning <br />
- Each directory will create 1 VM as result of lab1. But with prefix dev/stage/prod for each resource in that environment. Save the state file of each environmnet dev/stage/prod.tfstate<br />

Reference <br />
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip<br />
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment<br />