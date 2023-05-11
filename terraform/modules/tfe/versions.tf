terraform {
  required_version = ">= 0.10"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.44"
    }

    github = {
      source = "integrations/github"
      version = ">= 5.25"
    }
  }
}
