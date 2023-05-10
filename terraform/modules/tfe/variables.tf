variable "organiztion" {
  description = "tfe organiztion name"
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
