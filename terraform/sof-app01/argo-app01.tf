resource "argocd_application" "sof-app01" {
  metadata {
    name = "sof-app01"
  }

  spec {
    project = "default"

    sync_policy {
      sync_options = ["Validate=true"]

      retry {
        limit = "1"

        backoff {
          duration     = "5s"
          factor       = "2"
          max_duration = "3m0s"
        }
      }
      automated {
        allow_empty = false
        prune       = false
        self_heal   = false
      }
    }
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "sof-app01"
    }

    source {
      repo_url        = "https://github.com/dimitardd/devops-programme"
      path            = "deployment"
      target_revision = "main"
    }
  }
}

