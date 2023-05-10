data "tfe_organization" "main" {
  name = var.organiztion
}

resource "tfe_workspace" "main" {
  for_each = var.workspaces

  terraform_version  = "~> 1.4"
  allow_destroy_plan = false

  name              = format("%s-%s", var.organiztion, each.key)
  organization      = data.tfe_organization.main.name
  working_directory = format("terraform/workloads/%s", each.key)

  vcs_repo {
    branch         = each.value.branch
    identifier     = each.value.identifier
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  tag_names = length(var.tags) > 0 ? var.tags : []
}

resource "tfe_variable" "aws_region" {
  for_each = {for k,v in var.workspaces : k => v.var_aws_region if lookup(v,"var_aws_region", false)}

  key          = "AWS_REGION"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.main[each.key].id
}

### Supporting Resource ###

resource "tfe_oauth_client" "github" {
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_token
  service_provider = "github"
}