
data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "this" {
  name = time_sleep.this.triggers["eks_cluster_name"]
}

data "aws_eks_cluster_auth" "this" {
  name = time_sleep.this.triggers["eks_cluster_name"]
}

resource "time_sleep" "this" {
  create_duration = "60s"

  triggers = {
    eks_cluster_name = module.eks.cluster_name # wait to be ready
  }
}