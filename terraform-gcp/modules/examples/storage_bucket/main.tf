provider "google" {
  project = var.project
}

locals {
  name = "the-bucket"
}

module "storage_bucket" {
  source = "../../storage"

  name          = local.name
  location      = "US-EAST1"
  storage_class = "COLDLINE"

  # iam_members = [{
  #   role   = "roles/storage.objectViewer"
  #   member = "group:test-gcp-ops@example.com"
  # }]
}

output "storage_bucket_url" {
  description = "The base URL of the bucket"
  value       = module.storage_bucket.bucket_url
}
