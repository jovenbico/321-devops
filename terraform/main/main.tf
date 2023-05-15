
provider "tfe" {
  organization = local.tfe_organization
}

provider "github" {
  token = local.github_token
}

locals {
  tfe_organization = var.TFE_ORGANIZATION
  tags             = [local.tfe_organization, "workspace"]

  github_token = var.GITHUB_TOKEN

  aws_config = {
    region            = var.AWS_REGION
    access_key_id     = var.AWS_ACCESS_KEY_ID
    secret_access_key = var.AWS_SECRET_ACCESS_KEY
  }
}

module "tfe" {
  source = "../modules/tfe"

  organization = local.tfe_organization

  github_token = local.github_token
  aws_config   = local.aws_config

  workspaces = {
    dev = {
      branch     = "main",
      identifier = "jovenbico/321-devops",
      var_aws    = true,
      var_github = true
    }
    # stage = {
    #   branch     = "main",
    #   identifier = "jovenbico/321-devops"
    # }
  }

  tags = local.tags
}
