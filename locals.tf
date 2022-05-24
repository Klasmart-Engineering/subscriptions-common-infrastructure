locals {
  terraform_organization = "kidsloop-infrastructure"

  dep_tools = nonsensitive(data.tfe_outputs.cluster-infra-tools.values)

  # Infra tools EKS variables (for ArgoCD / Teleport)
  tools_cluster_endpoint                      = local.dep_tools.cluster_endpoint
  tools_kubeconfig_certificate_authority_data = local.dep_tools.kubeconfig_certificate_authority_data

  argocd_project_name = "subscriptions"
  argocd_namespace    = "argocd"
  istio_namespace     = "istio-system"

  product_namespace = "subscriptions"
}
