output "public_ip_address" {
  value = var.public_ip ? tencentcloud_eip.this[0].public_ip : null
}

output "private_ip_address" {
  value = tencentcloud_instance.this.private_ip
}
