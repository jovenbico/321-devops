locals {
  github_repository = length(var.GITHUB_REPOSITORY) > 0 ? var.GITHUB_REPOSITORY : "321-devops"
}

provider "github" {
  token = var.GITHUB_TOKEN
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = local.github_repository
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = var.AWS_ACCESS_KEY_ID
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository       = local.github_repository
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  plaintext_value  = var.AWS_SECRET_ACCESS_KEY
}