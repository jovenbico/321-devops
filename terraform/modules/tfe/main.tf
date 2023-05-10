data "tfe_organization" "main" {
  name = var.organiztion
}

resource "tfe_workspace" "main" {
  for_each = var.workspaces

  terraform_version  = "~> 1.3"
  allow_destroy_plan = false

  name              = each.key
  organization      = data.tfe_organization.main.name
  working_directory = format("terraform/workloads/%s", each.key)

  vcs_repo {
    branch         = each.value.branch
    identifier     = each.value.identifier
    oauth_token_id = each.value.oauth_token_id
  }

  tag_names = length(var.tags) > 0 ? var.tags : []
}
