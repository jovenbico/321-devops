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
  type = list(string)
  default = []
}