/**
 * # Terraform Docs CI Example
 *
 * Everything in this comment block will get extracted.
 *
 * You can put simple text or complete Markdown content
 * here. Subsequently if you want to render AsciiDoc format
 * you can put AsciiDoc compatible content in this comment
 * block.
 */

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

output "cos_bucket_url" {
  value       = tencentcloud_cos_bucket.tfstate.cos_bucket_url
  description = "COS bucket name"
}
