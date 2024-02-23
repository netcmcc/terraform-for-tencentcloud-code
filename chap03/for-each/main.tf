data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_instance" "this" {
  instance_name = var.server_name
  instance_type = var.instance_type
  image_id      = data.tencentcloud_images.this.images.0.image_id

  vpc_id                  = tencentcloud_vpc.this.id
  subnet_id               = tencentcloud_subnet.this["guangzhou-three"].id
  availability_zone       = tencentcloud_subnet.this["guangzhou-three"].availability_zone
  orderly_security_groups = [tencentcloud_security_group.this.id]

  allocate_public_ip         = true
  internet_max_bandwidth_out = 5
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  user_data                  = base64encode(file("startup.sh"))

  ## Uncomment the following five lines
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
