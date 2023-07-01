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
    data_disk_type = var.disks["small-disk"].type
    data_disk_size = var.disks["small-disk"].size
  }

  data_disks {
    data_disk_type = var.disks["medium-disk"].type
    data_disk_size = var.disks["medium-disk"].size
  }

  data_disks {
    data_disk_type = var.disks["large-disk"].type
    data_disk_size = var.disks["large-disk"].size
  }

  # dynamic "data_disks" {
  #   for_each = var.disks
  #   content {
  #     data_disk_size = data_disks.value["size"]
  #     data_disk_type = data_disks.value["type"]
  #   }
  # }

}
