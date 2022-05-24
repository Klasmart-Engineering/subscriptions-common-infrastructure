resource "tfe_workspace" "workspace" {
  name = var.workspace_name

  organization   = var.tfe_organization_name
  execution_mode = "remote"

  description       = var.workspace_description
  tag_names         = concat(["lay:offering"], local.tfe_tags)
  terraform_version = var.terraform_version

  # Deploy settings
  ssh_key_id        = data.tfe_ssh_key.deploy.id
  working_directory = local.working_directory
  vcs_repo {
    identifier         = var.env_repo
    branch             = var.env_repo_default_branch
    ingress_submodules = false
    oauth_token_id     = var.vcs_oauth_token_id
  }
}
# RBAC settings
resource "tfe_team_access" "workspace" {
  for_each     = var.tfe_team_access_permissions

  workspace_id = tfe_workspace.workspace.id
  team_id      = data.tfe_team.team_name_id_lookup[each.key].id
  access       = each.value
}