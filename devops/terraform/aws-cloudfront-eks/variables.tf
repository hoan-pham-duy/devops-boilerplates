# Terraform Cloud project
variable "cloud_workspace" {
  description = "Terraform Cloud project"
  type        = string
  default     = "mern-devops-"
}

# AWS configuration
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}
# Frontend configuration
variable "bucket_prefix" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "v2mern-"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
  default     = ""#TODO Fill your domain in Route53 here
}

# State file configuration

variable "bucket_prefix_tfstate" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "v2merntf-"
}
