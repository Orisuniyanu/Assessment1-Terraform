variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
}

variable "ssh_password" {
  description = "SSH password"
  type        = string
  sensitive   = true
}

variable "vm_ip" {
  description = "VM IP address"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}
variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

