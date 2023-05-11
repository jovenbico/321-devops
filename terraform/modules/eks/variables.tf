variable "name" {
  description = "Name of the cluster"
  type        = string
}

variable "vpc_config" {
  description = "VPC configuration"
  type        = any
  default     = {}
}

variable "tags" {
  description = "Resource tags"
  type        = any
  default     = {}
}
