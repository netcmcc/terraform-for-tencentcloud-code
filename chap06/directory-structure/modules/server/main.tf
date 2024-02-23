locals {
  machine_type_mapping = {
    small  = "S5.MEDIUM2"
    medium = "S5.MEDIUM4"
    large  = "S6.LARGE8"
  }
  instance_type = local.machine_type_mapping[var.machine_size]
}

data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_eip" "this" {
  count                      = var.public_ip ? 1 : 0
  name                       = "${var.name}-eip"
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 5
}

resource "tencentcloud_instance" "this" {
  instance_name     = var.name
  instance_type     = local.instance_type
  availability_zone = var.zone
  image_id          = data.tencentcloud_images.this.images.0.image_id
  user_data         = base64encode(file("${path.module}/startup.sh"))
  tags = {
    "created_by"  = "terraform"
    "environment" = var.environment
  }
}

resource "tencentcloud_eip_association" "this" {
  count       = var.public_ip ? 1 : 0
  eip_id      = tencentcloud_eip.this[0].id
  instance_id = tencentcloud_instance.this.id
}

