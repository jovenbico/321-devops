terraform {
  required_version = ">= 0.13"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.44.1"
    }
  }
}
