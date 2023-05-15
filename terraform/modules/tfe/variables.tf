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

variable "aws_config" {
  description = "AWS Configuration"
  type = object({
    region            = string
    access_key_id     = string
    secret_access_key = string
  })
}

variable "github_config" {
  description = "Github Configuration"
  type = object({
    token        = string
    organization = string
    repository   = string
  })
}
