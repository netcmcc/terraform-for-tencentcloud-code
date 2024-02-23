resource "tencentcloud_vpc" "vpc" {
  name       = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "tencentcloud_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  vpc_id            = tencentcloud_vpc.vpc.id
  name              = each.value.name
  cidr_block        = each.value.cidr
  availability_zone = each.value.zone
}
