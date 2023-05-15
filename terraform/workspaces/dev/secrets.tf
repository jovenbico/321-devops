locals {
  github_repo = length(var.GITHUB_REPO) > 0 ? var.GITHUB_REPO : "321-devops"
}

provider "github" {
  token = var.GITHUB_TOKEN
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = local.github_repo
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = var.AWS_ACCESS_KEY_ID
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository       = local.github_repo
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  plaintext_value  = var.AWS_SECRET_ACCESS_KEY
}