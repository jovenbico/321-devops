provider "tfe" {
  token        = var.TERRAFORM_IO_TOKEN
  organization = var.TERRAFORM_IO_ORGANIZATION
}

provider "github" {
  token = var.GITHUB_TOKEN
}

locals {
  organiztion = "321-devops"

  # [for k,v in local.workspaces : "${k} has ${v.a}"]
  # {for k,v in local.workspaces : v.a => k}
  # {for k,v in local.workspaces : k => v.var_aws_region if v.var_aws_region}
  workspaces = {
    test1 = {
      branch     = "main",
      identifier = "jovenbico/321-devops",
      var_aws    = true
    },
    test2 = {
      branch     = "main",
      identifier = "jovenbico/321-devops"
    }
  }

  tags = ["321-devops", "workspace"]
}

module "tfe" {
  source = "../../tfe"

  organiztion = local.organiztion

  github_token          = var.GITHUB_TOKEN
  aws_region            = "*"
  aws_access_key_id     = "*"
  aws_secret_access_key = "*"

  workspaces = local.workspaces

  tags = local.tags
}
