variable "compute_image_family" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "compute_image_project" {
  type    = string
  default = "ubuntu-os-cloud"
}

variable "name" {
  type        = string
  description = "value"
}

variable "machine_type" {
  type        = string
  description = "value"
  default     = "e2-medium"
}

variable "zone" {
  type        = string
  description = "value"
  default     = "us-central1-a"
}

variable "tags" {
  type        = list(string)
  description = "value"
  default     = []
}
