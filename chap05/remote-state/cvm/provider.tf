terraform {
  required_version = ">= 1.3.0"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.81.73"
    }
  }
}

provider "tencentcloud" {
  region = var.region
}
