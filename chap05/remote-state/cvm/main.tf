data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_instance" "this" {
  instance_name     = var.server_name
  instance_type     = var.instance_type
  availability_zone = var.zone
  image_id          = data.tencentcloud_images.this.images.0.image_id

  allocate_public_ip         = true
  internet_max_bandwidth_out = 5
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  user_data = base64encode(templatefile(
    "startup.tftpl",
    { endpoint = data.terraform_remote_state.mysql.outputs.endpoint }
  ))
}

output "URL" {
  value = format("http://%s", tencentcloud_instance.this.public_ip)
}
