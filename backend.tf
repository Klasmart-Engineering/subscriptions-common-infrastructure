terraform {
  cloud {
    organization = "kidsloop-infrastructure"
    workspaces {
      name = "subscriptions-common-infrastructure"
    }
  }
}