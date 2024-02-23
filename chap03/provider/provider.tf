terraform {
  required_version = ">= 1.3.0"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "~> 1.81"
    }
  }
}

provider "tencentcloud" {
  region = "ap-guangzhou"
}

provider "tencentcloud" {
  region = "ap-shanghai"
  alias  = "staging"
}
