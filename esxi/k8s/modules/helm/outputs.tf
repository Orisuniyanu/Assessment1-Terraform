output "datadog_namespace" {
  value = helm_release.datadog.namespace
}

output "metrics_server_status" {
  value = helm_release.metrics_server.status
}
