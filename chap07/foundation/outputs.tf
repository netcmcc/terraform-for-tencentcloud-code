output "vpc_id" {
  value = tencentcloud_vpc.vpc.id
}

output "vpc_cidr" {
  value = tencentcloud_vpc.vpc.cidr_block
}

output "subnet_ids" {
  value = [
    for subnet in tencentcloud_subnet.subnet : subnet.id
  ]
}

output "zones" {
  value = [
    for subnet in tencentcloud_subnet.subnet : subnet.availability_zone
  ]
}
