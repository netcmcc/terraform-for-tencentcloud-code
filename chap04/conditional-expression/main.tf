data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_eip" "this" {
  count                      = var.public_ip ? 1 : 0
  name                       = "${var.server_name}-eip"
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 5
}

resource "tencentcloud_instance" "this" {
  instance_name     = var.server_name
  instance_type     = var.instance_type
  availability_zone = var.zone
  image_id          = data.tencentcloud_images.this.images.0.image_id
}

resource "tencentcloud_eip_association" "this" {
  count       = var.public_ip ? 1 : 0
  eip_id      = tencentcloud_eip.this[0].id
  instance_id = tencentcloud_instance.this.id
}

# resource "tencentcloud_instance" "this" {
#   instance_name              = var.server_name
#   instance_type              = var.instance_type
#   availability_zone          = var.zone
#   image_id                   = data.tencentcloud_images.this.images.0.image_id
#   allocate_public_ip         = var.public_ip
#   internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
#   internet_max_bandwidth_out = var.public_ip ? 5 : 0
# }
