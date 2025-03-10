locals {
  terraform_organization = "kidsloop-infrastructure"

  dep_tools                        = nonsensitive(data.tfe_outputs.cluster-infra-tools.values)
  dep_tools_controllers_apifactory = nonsensitive(data.tfe_outputs.cluster-infra-tools.values)

  # Infra tools EKS variables (for ArgoCD / Teleport)
  tools_cluster_endpoint                      = local.dep_tools.cluster_endpoint
  tools_kubeconfig_certificate_authority_data = local.dep_tools.kubeconfig_certificate_authority_data

  tf_workspace_auto_apply = true
  argocd_project_name     = "subscriptions"
  argocd_namespace        = "argocd"
  istio_namespace         = "istio-system"

  product_namespace = "subscriptions"

  # TODO(INFRAENG-243): Pull these values from other workspace outputs
  # Used by workspaces module
  environments = {
    apifactory = {
      region                  = "eu-west-2"
      project_environment     = "apifactory"
      project_region          = "uk"
      service_owner           = "Infra"
      workspace_name          = "subscriptions-apifactory-uk"
      env_repo                = "KL-Engineering/subscriptions-gitops-env"
      domain                  = "apifactory.kidsloop.live"
      env_repo_default_branch = "main"
      working_directory       = "apifactory/uk/tools"
      workspace_description   = "Subscriptions workspace"
    }
  }
}
