terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.81.73"
    }
  }
}

provider "tencentcloud" {
  region     = "ap-guangzhou"
  secret_id  = "my-secret-id"
  secret_key = "my-secret-key"
}
