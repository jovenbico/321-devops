locals {
  organiztion = "321-devops-1"

  # [for k,v in local.workspaces : "${k} has ${v.a}"]
  # {for k,v in local.workspaces : v.a => k}
  workspaces = {
    work1 = {
      branch = "main",
      identifier = "jovenbico/321-devops"
      oauth_token_id = "github.oauth_token_id*"
    },
    work2 = {
      branch = "main",
      identifier = "jovenbico/321-devops"
      oauth_token_id = "github.oauth_token_id*"
    }
  }

  tags = ["321-devops", "workload"]
}

module "tfe" {
  source = "../../tfe"

  organiztion = local.organiztion
  workspaces  = local.workspaces

  tags = local.tags
}
