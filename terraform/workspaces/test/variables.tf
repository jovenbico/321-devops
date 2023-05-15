variable "AWS_REGION" {
  description = "AWS region"
  type        = string

  default = "us-east-1"
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
  description = "Github personal access token"
  type        = string

  sensitive = true
}
