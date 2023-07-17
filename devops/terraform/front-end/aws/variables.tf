variable "region" {
  type        = string
  description = "The AWS Region to use"
  default     = "us-east-1"
}

variable "bucket_prefix" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "mern-devops-"
}

variable "bucket_prefix_tfstate" {
  type        = string
  description = "The prefix for the S3 bucket"
  default     = "mern-devops-tfstate"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
  default     = ""#TODO Fill your domain in Route53 here
}