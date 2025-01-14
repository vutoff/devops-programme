resource "helm_release" "argo-rollouts" {
  description = "Deplayte Argo Rollouts"
  name = "argo-rollouts"

  repository       = "http://slo-it-nexus01.pt.playtech.corp/repository/helm-argocd"
  chart            = "argo-rollouts"
  namespace        = "argo-rollouts"
  create_namespace = false
  version          = "2.38.2"

  values = [file("../values/argo-rollouts.yaml")]
}
