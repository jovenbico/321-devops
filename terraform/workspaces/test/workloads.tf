locals {

  addon_ingress_nginx  = true
  addon_metrics_server = true
  deploy_hello_app     = true

}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.this.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
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