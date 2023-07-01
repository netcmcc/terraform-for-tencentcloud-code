locals {
  machine_type_mapping = {
    small  = "S5.SMALL2"
    medium = "S5.MEDIUM4"
    large  = "S5.LARGE8"
  }
  instance_type = local.machine_type_mapping[var.machine_size]
}

data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_instance" "this" {
  instance_name     = var.name
  instance_type     = local.instance_type
  availability_zone = var.zone
  image_id          = data.tencentcloud_images.this.images.0.image_id

  allocate_public_ip         = var.public_ip
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = var.public_ip ? 5 : null
  user_data                  = base64encode(file("${path.module}/startup.sh"))
}
