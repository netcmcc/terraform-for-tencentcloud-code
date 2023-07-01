data "tencentcloud_images" "this" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "Ubuntu Server 22.04 LTS"
}

resource "tencentcloud_instance" "this" {
  instance_name     = var.server_name
  instance_type     = var.instance_type
  availability_zone = var.zone
  image_id          = data.tencentcloud_images.this.images.0.image_id

  data_disks {
    data_disk_type = "CLOUD_PREMIUM"
    data_disk_size = 50
  }

  data_disks {
    data_disk_type = "CLOUD_SSD"
    data_disk_size = 70
  }

  data_disks {
    data_disk_type = "CLOUD_SSD"
    data_disk_size = 100
  }

  # dynamic "data_disks" {
  #   for_each = var.disks
  #   content {
  #     data_disk_size = data_disks.value["size"]
  #     data_disk_type = data_disks.value["type"]
  #   }
  # }

}
