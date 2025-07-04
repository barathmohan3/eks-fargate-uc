output "frontend_namespace" {
  value = kubernetes_namespace.frontend.metadata[0].name
}
