# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

