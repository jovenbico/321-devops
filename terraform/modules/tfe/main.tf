data "tfe_organization" "main" {
  name = var.organization
}

resource "tfe_workspace" "main" {
  for_each = var.workspaces

  terraform_version  = "~> 1.4"
  allow_destroy_plan = false

  name              = format("%s-%s", var.organization, each.key)
  organization      = data.tfe_organization.main.name
  working_directory = format("terraform/workspaces/%s", each.key)

  vcs_repo {
    branch         = each.value.branch
    identifier     = each.value.identifier
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }

  tag_names = concat(length(var.tags) > 0 ? var.tags : [], [
    each.key
  ])
}

resource "tfe_variable" "aws_region" {
  for_each = { for k, v in var.workspaces : k => v.var_aws if lookup(v, "var_aws", false) }

  key          = "AWS_REGION"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.main[each.key].id
}

resource "tfe_variable" "aws_access_key_id" {
  for_each = { for k, v in var.workspaces : k => v.var_aws if lookup(v, "var_aws", false) }

  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "terraform"
  workspace_id = tfe_workspace.main[each.key].id

  sensitive = true
}

resource "tfe_variable" "aws_secret_access_key" {
  for_each = { for k, v in var.workspaces : k => v.var_aws if lookup(v, "var_aws", false) }

  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "terraform"
  workspace_id = tfe_workspace.main[each.key].id

  sensitive = true
}

resource "tfe_variable" "github_token" {
  for_each = { for k, v in var.workspaces : k => v.var_aws if lookup(v, "var_github", false) }

  key          = "GITHUB_TOKEN"
  value        = var.github_token
  category     = "terraform"
  workspace_id = tfe_workspace.main[each.key].id

  sensitive = true
}

###########################
### Supporting Resource ###
###########################
resource "tfe_oauth_client" "github" {
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_token
  service_provider = "github"
}
