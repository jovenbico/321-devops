locals {
  addon_ingress_nginx = var.addon_ingress_nginx

  name = "ingress-nginx"
}

resource "helm_release" "this" {
  count = (local.addon_ingress_nginx ? 1 : 0)

  name        = local.name
  namespace   = "kube-system"
  description = "Ingress Nginx helm Chart deployment configuration"
  repository  = "https://kubernetes.github.io/ingress-nginx/"
  chart       = local.name
  version     = "4.6.1"

  set {
    name  = "controller.ingressClassResource.default"
    value = true
  }
}
