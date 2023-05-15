provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  name   = "the-eks"
  region = var.AWS_REGION

  cluster_version = "1.25"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)

  tags = {
    Workspace = local.name
  }
}

################################################################################
# Cluster
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.12"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  # EKS Addons
  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
    vpc-cni    = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    initial = {
      instance_types = ["t3.small", "t3.medium"]
      # capacity_type  = "SPOT"

      min_size     = 3
      max_size     = 5
      desired_size = 3
    }
  }

  tags = local.tags
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
