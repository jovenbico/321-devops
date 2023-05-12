locals {
  addon_metrics_server = var.addon_metrics_server

  name = "metrics-server"
}

resource "helm_release" "metrics_server" {
  count = (local.addon_metrics_server ? 1 : 0)

  name        = local.name
  namespace   = "kube-system"
  description = "Metric server helm Chart deployment configuration"
  repository  = "https://kubernetes-sigs.github.io/metrics-server/"
  chart       = local.name
  version     = "3.10.0"
}
