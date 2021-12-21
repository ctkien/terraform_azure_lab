Requirements: <br />
- Create 3 directory with 3 environment: dev, staging, prod <br />
- Create requirement to save terraform state in blob storage account. Enable versioning <br />
- Use directory structure with :main.tf, outputs.tf, variables.tf, versions.tf, providers.tf <br />
- Use 3 state file for 3 environment: dev.tfstate, staging.tfstate, prod.tfstate <br />
- use the same source code as Lab 2. Rewrite as module: base_network (resource group, vnet, subnet), linux_server(server,interface,publicip, security group...) <br />