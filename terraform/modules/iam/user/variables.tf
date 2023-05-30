variable "name" {
  description = "User name"
  type        = string
}

variable "force_destroy" {
  description = "Force Destroy IAM user"
  type        = bool
  default     = false
}
