Command to init with backend: <br />
terraform init -backend-config=./env/dev-backend.tfvars <br />
Command to apply with tfvars: <br />
terraform apply -var-file=./env/dev.tfvars -var-file=./env/dev-backend.tfvars <br />