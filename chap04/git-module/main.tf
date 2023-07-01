module "server1" {
  source = "git::https://github.com/netcmcc/terraform-for-tencentcloud.git//chap04/modules/server"
  name   = "${var.server_name}-1"
}

module "server2" {
  source       = "git::https://github.com/netcmcc/terraform-for-tencentcloud.git//chap04/modules/server/?ref=master"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_size = "medium"
}

module "server3" {
  source       = "git::https://github.com/netcmcc/terraform-for-tencentcloud.git//chap04/modules/server/?ref=master"
  name         = "${var.server_name}-3"
  zone         = "us-central1-f"
  machine_size = "large"
}
