variable "kubernetes_server_urls" {
  type = list(object({
    environment = string
    url         = string
  }))

  description = "All the target Kubernetes cluster urls"

  default = [{
    environment = "apifactory-uk"
    url         = "https://EFC4B481A0B23459D26FE96D8985F7E3.gr7.eu-west-2.eks.amazonaws.com"
  }]
}

variable "helm_source_repositories" {
  description = "A list of repositories that the ArgoCD project is whitelisted for"
  type        = list(string)
  default = [
    "https://helm.releases.hashicorp.com",
    "https://raw.githubusercontent.com/kl-engineering/microgateway-istio-base-helm/main",
    "https://raw.githubusercontent.com/kl-engineering/microgateway-base-helm/main",
    "https://raw.githubusercontent.com/kl-engineering/terraform-base-helm/main",
    "git@github.com:KL-Engineering/subscriptions-gitops-env.git",
  ]
}


# This is set in TFE workspace and is being consumed here
variable "tools_cluster_tfc_sa_token" {
  description = "Service account token for Kubernetes service account to connect to Tools cluster"
  type        = string
}
