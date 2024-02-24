terraform {
  required_version = ">= 1.3.0"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.81.0"
    }
  }
}

provider "tencentcloud" {
  region = var.region
}

provider "helm" {
  kubernetes {
    host                   = module.tke.cluster_endpoint
    client_certificate     = module.tke.client_certificate
    client_key             = module.tke.client_key
    cluster_ca_certificate = module.tke.cluster_ca_certificate
  }
}
