output "instance_ip_addr" {
  value = [
    tencentcloud_instance.this.public_ip,
    tencentcloud_instance.staging.public_ip
  ]
}
