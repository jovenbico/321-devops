terraform {
  cloud {
    organization = "321-devops"
    workspaces {
      tags = [
        "321-devops", "main"
      ]
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.44.0"
    }

    github = {
      source = "integrations/github"
      version = "~> 5.25.0"
    }
  }

  required_version = ">= 1.4.6"
}