variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "datadog_api_key" {
  description = "API key for Datadog agent"
  type        = string
}

variable "datadog_site" {
  description = "Datadog site (e.g., datadoghq.com)"
  type        = string
  default     = "datadoghq.com"
}
variable "esxi_host" {
  description = "ESXi host URL"
  type        = string
}

variable "username" {
  description = "ESXi username"
  type        = string
}

variable "password" {
  description = "ESXi password"
  type        = string
}
variable "guest_name" {
  description = "Name of the guest VM"
  type        = string
}

variable "disk_store" {
  description = "Datastore for the VM"
  type        = string
}

variable "memsize" {
  description = "Memory size for the VM"
  type        = string
}

variable "guest_os" {
  description = "Guest OS type"
  type        = string
}

variable "disk_size" {
  description = "Disk size for the VM"
  type        = string
}

variable "numvcpus" {
  description = "Number of virtual CPUs for the VM"
  type        = number
}

variable "virtual_network" {
  description = "Virtual network for the VM"
  type        = string
}

variable "iso_path" {
  description = "Path to the ISO file for the VM"
  type        = string
}

