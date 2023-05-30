provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

module "iam_group" {
  source = "../../iam/group"

  name = "dev.group"
}
