locals {
  organiztion = "321-devops"

  # [for k,v in local.workspaces : "${k} has ${v.a}"]
  # {for k,v in local.workspaces : v.a => k}
  workspaces = {
    work1 = {
      branch = "main",
      identifier = "jovenbico/321-devops"
    },
    work2 = {
      branch = "main",
      identifier = "jovenbico/321-devops"
    }
  }

  tags = ["321-devops", "workspace"]
}

provider "tfe" {
  token        = var.TERRAFORM_IO_TOKEN
  organization = var.TERRAFORM_IO_ORGANIZATION
}

module "tfe" {
  source = "../../tfe"

  organiztion = local.organiztion
  github_token = "*"
  
  workspaces  = local.workspaces

  tags = local.tags
}
