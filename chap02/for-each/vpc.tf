resource "tencentcloud_vpc" "this" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "tencentcloud_subnet" "this" {
  # uncomment the next line for depends_on
  depends_on        = [tencentcloud_vpc.this]
  for_each          = var.subnets
  vpc_id            = tencentcloud_vpc.this.id
  name              = each.key
  availability_zone = each.value["zone"]
  cidr_block        = each.value["ip_cidr_block"]
}
