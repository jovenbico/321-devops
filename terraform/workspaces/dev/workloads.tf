locals {

  addon_ingress_nginx  = true
  addon_metrics_server = true
  deploy_hello_app     = true

}

resource "time_sleep" "this" {
  create_duration = "10s"

  triggers = {
    cluster_name = module.eks.cluster_name # wait to be ready
  }
}

data "aws_eks_cluster" "this" {
  name = time_sleep.this.triggers["cluster_name"]
}

data "aws_eks_cluster_auth" "this" {
  name = time_sleep.this.triggers["cluster_name"]
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}

################################################################################
# EKS addons
################################################################################
module "addon_ingress_nginx" {
  addon_ingress_nginx = local.addon_ingress_nginx

  source = "../../modules/addons/nginx-ingress"

}
module "addon_metrics_server" {
  addon_metrics_server = local.addon_metrics_server

  source = "../../modules/addons/metrics-server"

}

################################################################################
# Application workloads
################################################################################
resource "helm_release" "hello_app" {
  count = (local.deploy_hello_app ? 1 : 0)

  name  = "hello-app"
  chart = "../../../applications/helm/chart"

}
