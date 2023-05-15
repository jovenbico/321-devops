terraform {
  cloud {
    organization = "321-devops"
    workspaces {
      tags = [
        "321-devops", "workspace", "dev"
      ]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.47"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.17"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8"
    }
    github = {
      source = "integrations/github"
      version = ">= 5.25"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.44.0"
    }
  }

  required_version = ">= 1.0"

}
