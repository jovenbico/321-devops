provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

module "iam_user" {
  source = "../../iam/user/"

  name = "dev.user_1"

  create_iam_access_key = true
  iam_access_key_status = "Active"

  force_destroy = true
}
