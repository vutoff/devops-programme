resource "argocd_application" "sof-app01" {
  metadata {
    name = "sof-app01"
  }

  spec {
    project = "default"

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "sof-app01"
    }

    source {
      repo_url        = "https://github.com/dimitardd/devops-programme"
      path            = "deployment"
      target_revision = "dimitardd-281024"
      # Uncomment and add if required:
      # repo            = "https://github.com/dimitardd/devops-programme"
    }
  }
}
