output "zones" {
  value = [for s in tencentcloud_instance.this[*] : "${s.instance_name}: ${s.availability_zone}"]
}
