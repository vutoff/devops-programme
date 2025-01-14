provider "helm" {
  kubernetes {
    config_path = "~/.kube/sof-lab03"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/sof-lab03"
  config_context = "sof-lab03"
}

resource "kubernetes_namespace" "sof-app01" {
  metadata {
    name = "sof-app01"
  }
}

terraform {
  backend "local" {
    path = "~/devops/telerik/terraform-argocd.tfstate"
  }
}
