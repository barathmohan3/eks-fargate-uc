output "backend_namespace" {
  value = kubernetes_namespace.backend.metadata[0].name
}
