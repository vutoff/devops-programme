resource "kubernetes_namespace_v1" "python_app" {
  metadata {
    name = var.app_name
  }
}

resource "kubernetes_pod_v1" "python_app_pod" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace_v1.python_app.metadata[0].name
    labels = {
      app = var.app_name
    }
  }

  spec {
    container {
      name  = "${var.app_name}-container"
      image = var.container_image

      port {
        container_port = var.container_port
      }
      env {
        name  = "PORT"
        value = var.container_port
      }
    }
  }
}

resource "kubernetes_service_v1" "python_app_service" {
  metadata {
    name      = "python-app-service"
    namespace = kubernetes_namespace_v1.python_app.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_pod_v1.python_app_pod.metadata[0].labels.app
    }

    port {
      port        = var.container_port
      target_port = var.container_port
    }

    type = "NodePort"
  }
}
