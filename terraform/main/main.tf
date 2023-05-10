locals {
  organiztion = "321-devops-1"
  tags        = ["321-devops", "workspace"]
}

# module "tfe" {
#   source = "../modules/tfe"

#   organiztion  = local.organiztion
#   github_token = var.GITHUB_TOKEN

#   workspaces = {
#     infra = {
#       branch         = "main",
#       identifier     = "jovenbico/321-devops"
#     },
#     dev = {
#       branch         = "main",
#       identifier     = "jovenbico/321-devops"
#     }
#   }

#   tags = local.tags
# }
