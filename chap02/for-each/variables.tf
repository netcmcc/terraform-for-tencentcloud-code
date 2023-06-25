variable "region" {
  type        = string
  description = "Default Region"
  default     = "ap-guangzhou"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "ap-guangzhou-3"
}

variable "server_name" {
  type        = string
  description = "Name of server"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "SA1.SMALL1"
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = map(any)
}

variable "sg_roles" {
  type = list(any)
}
