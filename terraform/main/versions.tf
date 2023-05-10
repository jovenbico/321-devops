terraform {
  required_version = ">= 1.4"

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
}

provider "tfe" {
  token        = var.TERRAFORM_IO_TOKEN
  organization = var.TERRAFORM_IO_ORGANIZATION
}