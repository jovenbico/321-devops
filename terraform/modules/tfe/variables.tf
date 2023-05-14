variable "organization" {
  description = "tfe organization name"
}

variable "workspaces" {
  description = "workspace context"
  type        = any
  default     = {}
}

variable "tags" {
  description = "workspace tags"
  type        = list(string)
  default     = []
}

variable "github_token" {
  description = "Github token"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "aws_access_key_id" {
  description = "AWS access key id"
  type        = string
  default     = ""

  sensitive = true
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
  default     = ""

  sensitive = true
}
