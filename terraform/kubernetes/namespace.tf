resource "kubernetes_namespace" "sof-app01" {
  metadata {
    name = "sof-app01"
  }
}

resource "kubernetes_namespace" "sof-app02" {
  metadata {
    name = "sof-app02"
  }
}
