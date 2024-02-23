module "server1" {
  source = "./modules/server"
  name   = "${var.server_name}-1"
}

module "server2" {
  source       = "./modules/server"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_size = "medium"
}

module "server3" {
  source       = "./modules/server"
  name         = "${var.server_name}-3"
  zone         = "ap-guangzhou-7"
  machine_size = "large"
  public_ip    = false
}
