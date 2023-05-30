provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

module "iam_user" {
  source = "../../iam/user/"

  name = "dev.user_1"

  force_destroy = true
}
