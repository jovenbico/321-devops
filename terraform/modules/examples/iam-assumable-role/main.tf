provider "aws" {}

locals {
}

module "iam_assumable_role" {
  source = "../../iam/assumable-role"

  role_name = "admin-role"

  trusted_role_services = ["ec2.amazonaws.com"]

  attach_admin_policy = true
  create_instance_profile = true
}

module "iam_assumable_ro_role" {
  source = "../../iam/assumable-role"

  role_name = "readonly-role"

  trusted_role_services = ["ec2.amazonaws.com"]

  attach_readonly_policy = true
}

output "iam_role_arn" {
  value = module.iam_assumable_role.iam_role_arn
}

output "iam_instance_profile_arn" {
  value = module.iam_assumable_role.iam_instance_profile_arn
}