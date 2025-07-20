# Terraform EKS Cluster with Metrics Server and Datadog Agent

This project provisions an AWS EKS (Elastic Kubernetes Service) cluster using Terraform and 
installs both the Kubernetes Metrics Server 
and the Datadog Agent using Helm charts, also managed through Terraform.

## 🔧 Infrastructure Components

### ✅ Provisioned with Terraform:

- **VPC** with public and private subnets
- **EKS Cluster** with managed node groups
- **Helm provider** configured to deploy charts on the cluster

### 📦 Helm Charts Installed:

- [Metrics Server](https://github.com/kubernetes-sigs/metrics-server)  
  Used for gathering resource metrics like CPU and memory usage.
- [Datadog Agent](https://docs.datadoghq.com/agent/)  
  Used for real-time monitoring and observability of the cluster.

---

## 📁 Project Structure

```bash
.
├── main.tf                 # Main configuration for VPC, EKS, Helm provider
├── variables.tf            # Input variable definitions
├── terraform.tfvars        # Variable values used in this project
├── outputs.tf              # Output values from Terraform
├── modules/
│   └── helm/
│       ├── datadog_agent.tf       # Datadog Helm chart deployment
│       ├── metric_server.tf       # Metrics Server Helm chart deployment
│       └── variables.tf           # Module-specific variables
```

## How to Use

1. Set Your Variables
Update the terraform.tfvars file with values specific to your AWS environment:

```bash
region            = "<your_aws_region>"
vpc_name          = "<name_of_your_vpc>"
vpc_cidr          = "<your_vpc_cidr_block>"
availability_zones = ["us-east-1a", "us-east-1b"]
public_subnets    = ["<your_public_subnet_1>", "<your_public_subnet_2>"]
private_subnets   = ["<your_private_subnet_1>", "<your_private_subnet_2>"]

project           = "<your_project_name>"
cluster_name      = "<your_cluster_name>"
cluster_version   = "1.27"

node_type         = "t3.medium"
desired_capacity  = 2  # Node group configuration
min_capacity      = 1  # Node group configuration
max_capacity      = 3 # Node group configuration

datadog_api_key   = "your_datadog_api_key"
```

2. Initialize and Apply Terraform

```bash
terraform init
terraform apply
```

3. Verify Deployments

After the Terraform apply completes, you can verify the deployments by checking the EKS cluster and the installed Helm charts:

```bash
kubectl get pods -n kube-system
kubectl get pods -n datadog 
```

## Check Datadog

Log in to your Datadog dashboard and navigate to:

- Infrastructure → Containers or Hosts

- Dashboards → Kubernetes Overview

You should start seeing data flow from your EKS cluster.

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```
