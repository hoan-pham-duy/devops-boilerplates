# Fill the information
```bash
terraform init
export TF_CLOUD_ORGANIZATION=<your-cloud-organization> && export TF_VAR_AWS_ACCESS_KEY=<your-acess-key> && export TF_VAR_AWS_SECRET_KEY=<your-secret-key> && export TF_VAR_region=<your-region> && TF_VAR_domain_name=<your-access-key> && terraform plan
```
# Help
## Pull the state to terraform.tfstate file
```bash
    terraform state pull >> terraform.tfstate
```