# Terraform Kubernetes Cluster Deployment with Datadog Monitoring

This project uses **Terraform** to deploy a Kubernetes cluster and install **Datadog monitoring** using Helm charts. It includes infrastructure provisioning, metrics collection, and log management setup.

---

## 📁 Project Structure

.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── esxi/
│ └── k8s/
│ ├── main.tf
│ ├── variables.tf
│ ├── scripts/
│ │ └── install_k8s.sh
│ └── modules/
│ └── helm/
│ ├── main.tf
│ ├── outputs.tf
│ └── terraform.tf

## 🚀 Features

- Deploys a Kubernetes cluster on an ESXi-hosted VM
- Installs **Datadog Agent** and **Cluster Agent** using Helm
- Enables **log collection**, **metrics**, and **Kubelet monitoring**
- Installs **Metrics Server** with TLS disabled (for internal testing)
- Organized using reusable Terraform modules

---

## 🔧 Technologies

- **Terraform**
- **Helm provider**
- **Kubernetes**
- **Datadog**
- **ESXi (on-prem VM)**
- **Calico CNI**

This project is designed to be modular and reusable, allowing for easy adjustments and scaling as needed. 
The root directory contains the main Terraform configuration, which provision new VM on a ESXI server (template) which can be configured later.

While the esxi directory is use for installation of fresh Kubernetes cluster which Datadog and matric server implemented.
