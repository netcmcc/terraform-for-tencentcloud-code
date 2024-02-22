variable "region" {
  type        = string
  description = "Default Region"
  default     = "ap-guangzhou"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "ap-guangzhou-6"
}

variable "db_settings" {
  description = "Map of the various DB Settings"
  type        = map(any)
}
