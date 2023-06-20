provider "google" {
  project = var.project
}

locals {
  name = "the-compute"
}

module "compute" {
  source = "../../compute"

  name = local.name
}

output "compute_external_ip" {
  value = module.compute.external_ip
}

output "compute_internal_ip" {
  value = module.compute.internal_ip
}