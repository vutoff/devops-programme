terraform {
  required_version = ">= 1.10"
  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "7.3.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/sof-lab03"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/sof-lab03"
  config_context = "sof-lab03"
}

provider "argocd" {
  server_addr = "localhost:8080"
  plain_text  = true
  insecure    = true
  username    = "admin"
  password    = var.password
}

terraform {
  backend "local" {
    path = "/Users/dimitar.dimitrov/devops/telerik/terraform-argocd.tfstate"
  }
}
