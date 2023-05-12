
provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name     = var.name
  region   = var.vpc_config.region
  vpc_cidr = var.vpc_config.vpc_cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, var.vpc_config.count_azs)

  tags = var.tags
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = format("%s-vpc", local.name)
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }

  tags = local.tags
}
