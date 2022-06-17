resource "argocd_project" "project" {
  metadata {
    name      = local.argocd_project_name
    namespace = local.argocd_namespace
  }

  spec {
    description  = "Deployment project group for Subscription related products."
    source_repos = local.argocd_project_whitelisted_repos

    # Allows access to the product namespace
    dynamic "destination" {
      for_each = local.environments
      content {
        namespace = local.product_namespace
        server    = destination.value["url"]
      }
    }

    # Allows access to the istio-system namespace
    # Required to allow tls certificates to be created under the istio-system namespace
    dynamic "destination" {
      for_each = local.environments
      content {
        namespace = local.istio_namespace
        server    = destination.value["url"]
      }
    }

    cluster_resource_whitelist {
      group = "*"
      kind  = "*"
    }

    orphaned_resources {
      warn = true
    }

    sync_window {
      kind         = "allow"
      applications = ["*"]
      clusters     = ["*"]
      namespaces   = ["*"]
      duration     = "30m"
      schedule     = "*/30 * * * *"
    }
  }
}

resource "argocd_repository" "microgateway-base-helm" {
  for_each = local.argocd_helm_repositories
  repo     = each.value.repo
  name     = each.key
  type     = "helm"
  username = "helm"
  password = var.github_repo_access_token
}
