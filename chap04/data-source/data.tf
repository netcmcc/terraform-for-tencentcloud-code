data "tencentcloud_instances" "this" {
  instance_name = "instance-1"
}
output "ip-address" {
  value = format("IP address of existing server: %s", element(concat(data.tencentcloud_instances.this.instance_list[*].private_ip, [""]), 0))
}
