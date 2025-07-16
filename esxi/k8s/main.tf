terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.2"
    }
    null = {
      source = "hashicorp/null"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

resource "null_resource" "k8s_install" {
  connection {
    type     = "ssh"
    user     = var.ssh_user
    password = var.ssh_password
    host     = var.vm_ip
  }

  provisioner "file" {
    source      = "scripts/install_k8s.sh"
    destination = "/tmp/install_k8s.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install_k8s.sh",
      "sudo /tmp/install_k8s.sh",
      # Install Helm
      "curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash"
    ]
  }
}

resource "null_resource" "kubeadm_ready" {
  depends_on = [null_resource.k8s_install]

  provisioner "local-exec" {
    command = "sleep 30 && kubectl --kubeconfig=${var.kubeconfig_path} get nodes --no-headers | grep -i ready"
  }
}

module "helm_charts" {
  source = "./modules/helm"
  kubeconfig_path = var.kubeconfig_path
  datadog_api_key  = var.datadog_api_key

  providers = {
    helm       = helm
    kubernetes = kubernetes
  }

  depends_on = [null_resource.kubeadm_ready]
}

output "cluster_name" {
  value = var.cluster_name
}

output "datadog_namespace" {
  value = module.helm_charts.datadog_namespace
}

output "metrics_server_status" {
  value = module.helm_charts.metrics_server_status
}
