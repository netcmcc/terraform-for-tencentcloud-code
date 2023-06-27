output "zones-splat" {
  description = "List of zones using a splat expression"
  value       = tencentcloud_instance.this[*].availability_zone
}

output "zones-for" {
  description = "List of zones using a for loop"
  value       = [for server in tencentcloud_instance.this : server.availability_zone]
}

output "zones-by-servers" {
  description = "Name of zone for each server"
  value       = [for s in tencentcloud_instance.this[*] : "${s.instance_name}: ${s.availability_zone}"]
}

output "URL_0" {
  description = "URL of first server"
  value       = format("http://%s", tencentcloud_instance.this[0].public_ip)
}
