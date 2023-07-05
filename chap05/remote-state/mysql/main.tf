resource "tencentcloud_mysql_instance" "this" {
  instance_name     = "example-mysql-instance"
  availability_zone = var.zone
  cpu               = 1
  mem_size          = 1000
  volume_size       = 50
  engine_version    = "8.0"
  force_delete      = true
}
