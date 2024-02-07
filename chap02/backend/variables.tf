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

variable "server_name" {
  type        = string
  description = "Name of server"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "S5.MEDIUM2"
}
