module "workspaces" {
  source = "git@github.com:KL-Infrastructure/terraform-tfe-ws-base.git?ref=v0.3.0"

  # Module inputs here
  region              = local.region
  project_environment = local.project_environment
  project_region      = local.project_region
  service_owner       = local.service_owner

  workspace_name          = local.workspace_name
  vcs_repo                = local.env_repo
  domain                  = local.domain
  vcs_repo_default_branch = local.env_repo_default_branch
  working_directory       = local.working_directory
  workspace_description   = local.workspace_description

  # RBAC settings
  tfe_team_access_permissions = {
    "Infrastructure" = "admin"
    "sso"            = "read"
  }
  # Notification settings
  notify_triggers = ["run:needs_attention", "run:applying", "run:completed", "run:errored"]
  tags = [
    "lay:product",
    "reg:${lower(local.region)}",
    "env:${lower(local.project_environment)}",
    "loc:${lower(local.project_region)}",
    "own:${lower(local.service_owner)}",
    "dom:${replace(local.domain, ".", "-")}",
  ]

  providers = {
    tfe = tfe
  }
}
