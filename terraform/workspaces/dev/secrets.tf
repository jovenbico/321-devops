locals {
  repository = "321-devops"
}

provider "github" {
  token = var.GITHUB_TOKEN
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = local.repository
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = var.AWS_ACCESS_KEY_ID
}

resource "github_actions_secret" "aws_secret_access_key" {
  repository       = local.repository
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = var.AWS_SECRET_ACCESS_KEY
}