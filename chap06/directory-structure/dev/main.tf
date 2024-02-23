data "tencentcloud_availability_zones_by_product" "this" {
  product = "cvm"
}

module "server1" {
  source       = "../modules/server"
  name         = "${var.server_name}-1"
  machine_size = "small"
  zone         = data.tencentcloud_availability_zones_by_product.this.zones[0].name
  environment  = var.environment
}

module "server2" {
  source       = "../modules/server"
  name         = "${var.server_name}-2"
  machine_size = "small"
  zone         = data.tencentcloud_availability_zones_by_product.this.zones[1].name
  environment  = var.environment
}
