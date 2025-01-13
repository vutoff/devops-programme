resource "helm_release" "argocd" {
  name = "argo-cd-7-1734333419"

  repository       = "http://slo-it-nexus01.pt.playtech.corp/repository/helm-argocd"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = "7.7.15"

  values = [file("values/argocd.yaml")]
}

resource "helm_release" "argo-rollouts" {
  name = "argo-rollouts"

  repository       = "http://slo-it-nexus01.pt.playtech.corp/repository/helm-argocd"
  chart            = "argo-rollouts"
  namespace        = "argocd"
  create_namespace = false
  version          = "2.38.2"

  values = [file("values/argo-rollouts.yaml")]
}
