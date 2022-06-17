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

# This is set in TFE workspace and is being consumed here
variable "tools_cluster_tfc_sa_token" {
  description = "Service account token for Kubernetes service account to connect to Tools cluster"
  type        = string
}

variable "github_repo_access_token" {
  description = "GitHub PAT for the Engineering Org - with access to repos"
  type        = string
}