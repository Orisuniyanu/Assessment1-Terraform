variable "datadog_api_key" {
  description = "API key for Datadog"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

