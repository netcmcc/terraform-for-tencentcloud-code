module "server1" {
  source        = "./modules/server"
  name          = "${var.server_name}-1"
  zone          = var.zone
  instance_type = var.instance_type
  public_ip     = true
}

module "server2" {
  source        = "./modules/server"
  name          = "${var.server_name}-2"
  zone          = var.zone
  instance_type = var.instance_type
  public_ip     = false
}

module "server3" {
  source        = "./modules/server"
  name          = "${var.server_name}-3"
  zone          = var.zone
  instance_type = "S5.MEDIUM4"
  public_ip     = true
}
