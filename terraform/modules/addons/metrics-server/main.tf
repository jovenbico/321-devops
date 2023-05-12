locals {
  addon_metrics_server = var.addon_metrics_server
}

resource "helm_release" "metrics_server" {
  count = (local.addon_metrics_server ? 1 : 0)

  name       = "metrics-server"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/metrics-server"
  chart      = "metrics-server/metrics-server"
  version    = "3.10.0"
}
