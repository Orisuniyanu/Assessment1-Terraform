variable "kubeconfig_path" {
  type = string
}

variable "datadog_api_key" {
  type = string
}

resource "helm_release" "datadog" {
  name             = "datadog"
  chart            = "datadog"
  repository       = "https://helm.datadoghq.com"
  namespace        = "datadog"
  create_namespace = true
  force_update     = true
  recreate_pods    = true

  set {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set {
    name  = "datadog.site"
    value = "us5.datadoghq.com"
  }

  set {
    name  = "datadog.kubelet.tlsVerify"
    value = "false"
  }

  set {
    name  = "datadog.logs.enabled"
    value = "true"
  }

  set {
    name  = "datadog.clusterAgent.enabled"
    value = "true"
  }

  set {
    name  = "agents.enabled"
    value = "true"
  }

  set {
    name  = "clusterAgent.enabled"
    value = "true"
  }
}

resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  chart      = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  namespace  = "kube-system"

  set {
    name  = "args[0]"
    value = "--kubelet-insecure-tls"
  }

  set {
    name  = "args[1]"
    value = "--kubelet-preferred-address-types=InternalIP"
  }

  timeout = 900
}
