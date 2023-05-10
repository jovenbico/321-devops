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
  }

  required_version = ">= 0.14.0"
}