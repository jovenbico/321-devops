provider "google" {
  project = var.project
}

locals {
  name = "the-bucket"
}

module "storage_bucket" {
  source = "../../storage"

  name = local.name
}

output "storage_bucket_url" {
  description = "The base URL of the bucket"
  value       = module.storage_bucket.bucket_url
}
