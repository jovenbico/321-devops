output "tfe_workspaces" {
  value = length(tfe_workspace.main) > 0 ? [for v in tfe_workspace.main : v.name] : []
}