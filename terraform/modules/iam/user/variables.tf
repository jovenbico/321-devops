variable "name" {
  description = "User name"
  type        = string
}

variable "force_destroy" {
  description = "Force Destroy IAM user"
  type        = bool
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key."
  type        = string
  default     = ""
}

variable "password_length" {
  description = "Password length"
  type        = number
  default     = 20
}

variable "password_reset_required" {
  description = "Password reset required"
  type        = bool
  default     = false
}
