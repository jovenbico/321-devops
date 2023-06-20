variable "name" {
  type        = string
  description = "Storage name"
}

variable "location" {
  type        = string
  description = "Storage location"
  default     = "US"
}

variable "iam_members" {
  description = "The list of IAM members to grant permissions on the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}