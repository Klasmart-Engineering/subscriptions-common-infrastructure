output "argocd_project_name" {
  description = "The name of the ArgoCD project for this offering"
  value       = local.argocd_project_name
}

output "offering_namespace" {
  description = "The kubernetes namespace assigned to this product offering"
  value       = local.offering_namespace
}