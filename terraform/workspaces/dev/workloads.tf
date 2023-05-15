locals {

  addon_ingress_nginx  = true
  addon_metrics_server = true
  deploy_hello_app     = true

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

resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"

  depends_on = [module.eks] # wait to be ready
}

################################################################################
# EKS addons
################################################################################
module "addon_ingress_nginx" {
  addon_ingress_nginx = local.addon_ingress_nginx

  source = "../../modules/addons/nginx-ingress"

  depends_on = [time_sleep.wait_10_seconds]
}
module "addon_metrics_server" {
  addon_metrics_server = local.addon_metrics_server

  source = "../../modules/addons/metrics-server"

  depends_on = [time_sleep.wait_10_seconds]
}

################################################################################
# Application workloads
################################################################################
resource "helm_release" "hello_app" {
  count = (local.deploy_hello_app ? 1 : 0)

  name  = "hello-app"
  chart = "../../../applications/helm/chart"

  depends_on = [time_sleep.wait_10_seconds]
}
