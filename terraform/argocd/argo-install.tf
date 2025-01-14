resource "helm_release" "argocd" {
  destination = "Deplay ArgoCD"
  name = "argo-cd-7-1734333419"

  repository       = "http://slo-it-nexus01.pt.playtech.corp/repository/helm-argocd"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = false
  version          = "7.7.15"

  values = [file("../values/argocd.yaml")]
}
