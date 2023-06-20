variable "name" {
  type        = string
  description = "Storage name"
}

variable "location" {
  type        = string
  description = "Storage location"
  default     = "US"
}

variable "storage_class" {
  type        = string
  description = "The Storage Class of the bucket"
  default     = "STANDARD"
}

variable "iam_members" {
  description = "The list of IAM members to grant permissions on the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}
