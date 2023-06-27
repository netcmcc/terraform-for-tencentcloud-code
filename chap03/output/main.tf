data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

data "tencentcloud_availability_zones_by_product" "this" {
  product = "cvm"
}

resource "tencentcloud_instance" "this" {
  count             = var.instance_number
  instance_name     = "${var.server_name}-${count.index}"
  instance_type     = var.instance_type
  availability_zone = data.tencentcloud_availability_zones_by_product.this.zones[count.index % length(data.tencentcloud_availability_zones_by_product.this.zones)].name
  image_id          = data.tencentcloud_images.this.images.0.image_id

  allocate_public_ip         = true
  internet_max_bandwidth_out = 5
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  user_data                  = base64encode(file("startup.sh"))
}
