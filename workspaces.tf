module "workspaces" {
  source = "git@github.com:KL-Infrastructure/terraform-tfe-ws-base.git"

  # Module inputs here
  region              = "eu-west-2"
  project_environment = "apifactory"
  project_region      = "uk"
  service_owner       = "Infra"

  workspace_name          = "subscriptions-apifactory-uk"
  env_repo                = "KL-Engineering/subscriptions-gitops-env"
  domain                  = "apifactory.kidsloop.live"
  env_repo_default_branch = "main"
  working_directory       = "apifactory/uk/terraform"
  workspace_description   = "Subscriptions workspace"

  # RBAC settings
  tfe_team_access_permissions = {
    "Infrastructure" = "admin"
    "sso"            = "read"
  }
  # Notification settings
  notify_triggers = ["run:needs_attention", "run:applying", "run:completed", "run:errored"]
  tags = [
    "lay:product",
    "reg:${lower(var.region)}",
    "env:${lower(var.project_environment)}",
    "loc:${lower(var.project_region)}",
    "own:${lower(var.service_owner)}",
    "dom:${replace(var.domain, ".", "-")}",
  ]

  providers = {
    tfe = tfe
  }
}