
provider "tfe" {
  token        = var.TERRAFORM_IO_TOKEN
  organization = var.TERRAFORM_IO_ORGANIZATION
}

provider "github" {
  token = var.GITHUB_TOKEN
}

locals {
  organiztion = "321-devops"
  tags        = ["321-devops", "main"]
}

module "tfe" {
  source = "../modules/tfe"

  organiztion  = local.organiztion
  github_token = var.GITHUB_TOKEN

  aws_region            = var.AWS_REGION
  aws_access_key_id     = var.AWS_ACCESS_KEY_ID
  aws_secret_access_key = var.AWS_SECRET_ACCESS_KEY

  workspaces = {
    infra = {
      branch     = "main",
      identifier = "jovenbico/321-devops",
      var_aws    = true
    },
    dev = {
      branch     = "main",
      identifier = "jovenbico/321-devops"
    }
  }

  tags = local.tags
}
