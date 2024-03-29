### Define terraform version and required providers
terraform {
  required_version = ">= 1.1.2"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "1.77.3"
    }
  }
}

provider "tencentcloud" {
  region = var.region
}

variable "region" {
  description = "The Tencent Cloud region (i.e.: `ap-guangzhou`)"
  type        = string
}

variable "bucket_prefix" {
  description = "The Terraform state Bucket prefix (i.e.: `tfstate`)"
  type        = string
}

data "tencentcloud_user_info" "current" {}

resource "tencentcloud_cos_bucket" "tfstate" {
  bucket = join("-", [var.bucket_prefix, data.tencentcloud_user_info.current.app_id])

  acl                  = "private"
  versioning_enable    = true
  encryption_algorithm = "AES256"

  tags = {
    "terraform_managed" = "true"
  }
}

output "bucket_name" {
  value       = tencentcloud_cos_bucket.tfstate.id
  description = "COS bucket name"
}
