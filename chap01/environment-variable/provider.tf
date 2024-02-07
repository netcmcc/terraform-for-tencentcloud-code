terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.81.73"
    }
  }
}

provider "tencentcloud" {
  region = "ap-guangzhou"
}
