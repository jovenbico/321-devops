terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 4.42, < 5.0"
    }

    random = {
      source = "hashicorp/random"
      version = ">= 3.5"
    }
  }
}