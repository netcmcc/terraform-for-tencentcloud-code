output "number" {
  value = var.number
}

output "string" {
  value = var.string
}

output "boolean" {
  value = var.bool
}

output "list" {
  value = var.list
}

output "splat" {
  value = var.list[*]
}

output "list_element" {
  value = var.list[1]
}

output "map" {
  value = var.map
}

output "map_element" {
  value = var.map.ap-guangzhou
}

output "nested_map_element" {
  value = var.nested_map.region
}

output "object" {
  value = var.object
}

output "object_element" {
  value = var.object.name
}
