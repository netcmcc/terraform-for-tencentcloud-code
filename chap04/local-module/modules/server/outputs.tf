output "public_ip_address" {
  value = var.public_ip ? tencentcloud_instance.this.public_ip : null
}

output "private_ip_address" {
  value = tencentcloud_instance.this.private_ip
}
