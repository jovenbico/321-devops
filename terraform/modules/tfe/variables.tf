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

variable "aws_config" {
  description = "AWS Configuration"
  type = object({
    region            = string
    access_key_id     = string
    secret_access_key = string
  })

  default = {
    region            = ""
    access_key_id     = ""
    secret_access_key = ""
  }

  sensitive = true
}
