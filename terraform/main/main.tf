
provider "tfe" {
  token        = var.TERRAFORM_IO_TOKEN
  organization = var.TERRAFORM_IO_ORGANIZATION
}

provider "github" {
  token = var.GITHUB_TOKEN
}

locals {
  tags        = ["321-devops", "workspace"]
}

module "tfe" {
  source = "../modules/tfe"

  organization = var.TERRAFORM_IO_ORGANIZATION

  github_token          = var.GITHUB_TOKEN
  aws_region            = var.AWS_REGION
  aws_access_key_id     = var.AWS_ACCESS_KEY_ID
  aws_secret_access_key = var.AWS_SECRET_ACCESS_KEY

  workspaces = {
    dev = {
      branch     = "main",
      identifier = "jovenbico/321-devops",
      var_aws    = true
    }
    # stage = {
    #   branch     = "main",
    #   identifier = "jovenbico/321-devops"
    # }
  }

  tags = local.tags
}
