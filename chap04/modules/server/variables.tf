variable "name" {
  type = string
}

variable "zone" {
  type    = string
  default = "ap-guangzhou-3"
}

variable "public_ip" {
  type    = bool
  default = true
}

variable "machine_size" {
  type    = string
  default = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.machine_size)
    error_message = "The machine size must be one of small, medium, and large."
  }
}
