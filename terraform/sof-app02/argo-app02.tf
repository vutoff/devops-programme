resource "argocd_application" "sof-app02" {
  metadata {
    name = "sof-app02"
  }

  spec {
    project = "default"

    sync_policy {
      sync_options = ["Validate=true"]

      retry {
        limit = "5"

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
      namespace = "sof-app02"
    }

    source {
      repo_url        = "https://github.com/dimitardd/devops-programme"
      path            = "rollout"
      target_revision = "main"
      # Uncomment and add if required:
      # repo            = "https://github.com/dimitardd/devops-programme"
    }
  }
}
