variable "region" {
  type        = string
  description = "Default Region"
  default     = "ap-guangzhou"
}

variable "server_name" {
  type        = string
  description = "Name of server"
}

variable "environment" {
  type        = string
  description = "Type of environment"
  default     = "dev"
}

