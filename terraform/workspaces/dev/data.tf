
data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "this" {
  name = time_sleep.this.triggers["eks_cluster_id"]
}

data "aws_eks_cluster_auth" "this" {
  name = time_sleep.this.triggers["eks_cluster_id"]
}

resource "time_sleep" "this" {
  create_duration = "60s"

  triggers = {
    eks_cluster_id = module.eks.cluster_id # wait to be ready
  }
}