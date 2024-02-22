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

variable "clb" {
  type = map(any)
}

variable "as" {
  type = map(any)
}

variable "asg_instance_types" {
  type = list(string)
}

