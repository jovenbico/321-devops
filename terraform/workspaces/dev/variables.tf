variable "AWS_REGION" {
  description = "AWS region"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key id"
  type        = string

  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret access key"
  type        = string

  sensitive = true
}

variable "GITHUB_TOKEN" {
  description = "Github token"
  type        = string

  sensitive = true
}

variable "GITHUB_REPOSITORY" {
  description = "Github repository"
  type        = string

  default = ""
}

