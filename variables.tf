variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "node_type" {
  description = "EC2 instance type for nodes"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of nodes in the cluster"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of nodes in the cluster"
  type        = number
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the VPC"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "project" {
  description = "Project tag for resources"
  type        = string
}

variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}


