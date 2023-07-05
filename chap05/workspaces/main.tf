data "tencentcloud_availability_zones_by_product" "this" {
  product = "cvm"
}

module "server1" {
  source      = "./modules/server"
  name        = "${var.server_name}-1"
  zone        = data.tencentcloud_availability_zones_by_product.this.zones[0].name
  environment = var.environment
}

module "server2" {
  source       = "./modules/server"
  name         = "${var.server_name}-2"
  zone         = data.tencentcloud_availability_zones_by_product.this.zones[1].name
  machine_size = "medium"
  environment  = var.environment
}

module "server3" {
  source       = "./modules/server"
  name         = "${var.server_name}-3"
  zone         = data.tencentcloud_availability_zones_by_product.this.zones[2].name
  machine_size = "large"
  public_ip    = true
  environment  = var.environment
}
