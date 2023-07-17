# Create Frontend infrastructure
```bash
terraform init
terraform plan
terraform apply
aws s3 cp terraform.tfstate s3://mern-devops-tfstate<timestamp>/terraform.tfstate
aws s3 cp terraform.tfstate.backup s3://mern-devops-tfstate<timestamp>/terraform.tfstate.backup
```
# Copy frontend files
```bash
aws s3 cp --recursive ../../../../frontend/build/ s3://mern-devops-<timestamp>/
```
