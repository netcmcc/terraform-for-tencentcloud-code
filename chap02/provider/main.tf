data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_instance" "this" {
  provider          = tencentcloud
  instance_name     = var.server_name
  instance_type     = var.instance_type
  availability_zone = var.zone
  image_id          = data.tencentcloud_images.this.images.0.image_id

  allocate_public_ip         = true
  internet_max_bandwidth_out = 5
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  user_data                  = base64encode(file("startup.sh"))
}

resource "tencentcloud_instance" "staging" {
  provider          = tencentcloud.staging
  instance_name     = var.server_name
  instance_type     = var.instance_type
  availability_zone = "ap-shanghai-2"
  image_id          = data.tencentcloud_images.this.images.0.image_id

  allocate_public_ip         = true
  internet_max_bandwidth_out = 5
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  user_data                  = base64encode(file("startup.sh"))
}
