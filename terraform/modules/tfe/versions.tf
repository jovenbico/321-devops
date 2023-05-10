terraform {
  required_version = ">= 0.13"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.44.1"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.17"
    }
  }
}
