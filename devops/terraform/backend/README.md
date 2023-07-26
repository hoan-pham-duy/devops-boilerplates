# Fill the information
```bash
export TF_CLOUD_ORGANIZATION=<your organization ID>
terraform init
export TF_VAR_AWS_ACCESS_KEY=<your-acess-key> && export TF_VAR_AWS_SECRET_KEY=<your-secret-key> && export TF_VAR_region=<your-region> && terraform plan
```
# Help
## Pull the state to terraform.tfstate file
```bash
    terraform state pull >> terraform.tfstate
```