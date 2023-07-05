terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.81.8"
    }
  }
}

provider "tencentcloud" {
  region = "ap-guangzhou"
}

data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_instance" "this" {
  instance_name     = "cloudshell"
  instance_type     = "S5.MEDIUM2"
  availability_zone = "ap-guangzhou-3"
  image_id          = data.tencentcloud_images.this.images.0.image_id
  tags = {
    environment = "dev"
  }
}
