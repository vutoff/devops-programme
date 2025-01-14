resource "kubernetes_namespace" "sof-app01" {
  description = "Create Namespace sof-app01"
  metadata {
    name = "sof-app01"
  }
}

resource "kubernetes_namespace" "sof-app02" {
  description = "Create Namespace sof-app02"
  metadata {
    name = "sof-app02"
  }
}

resource "kubernetes_namespace" "argocd" {
  description = "Create Namespace argocd"
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_namespace" "argo-rollouts" {
  description = "Create Namespace argo-rollouts"
  metadata {
    name = "argo-rollouts"
  }
}
