resource "argocd_project" "project" {
  metadata {
    name      = local.argocd_project_name
    namespace = "argocd"
  }

  spec {
    description  = "Deployment project group for Subscription related products."
    source_repos = var.helm_source_repositories

    dynamic "destination" {
      for_each = var.kubernetes_server_urls
      content {
        namespace = local.offering_namespace
        server = destination.value["url"]
      }
    }

    # Required to allow tls certificates to be created under the istio-system namespace
    dynamic "destination" {
      for_each = var.kubernetes_server_urls
      content {
        namespace = "istio-system"
        server = destination.value["url"]
      }
    }

    cluster_resource_whitelist {
      group = "*"
      kind  = "*"
    }

    orphaned_resources {
      warn = true
      #   ignore {
      #     group = "apps/v1"
      #     kind  = "Deployment"
      #     name  = "ignored1"
      #   }
    }
    # role {
    #   name = "testrole"
    #   policies = [
    #     "p, proj:myproject:testrole, applications, override, myproject/*, allow",
    #     "p, proj:myproject:testrole, applications, sync, myproject/*, allow",
    #   ]
    # }
    sync_window {
      kind         = "allow"
      applications = ["*"]
      clusters     = ["*"]
      namespaces   = ["*"]
      duration     = "30m"
      schedule     = "*/30 * * * *"
    }
    # signature_keys = [
    #   "4AEE18F83AFDEB23",
    #   "07E34825A909B250"
    # ]
  }
}
