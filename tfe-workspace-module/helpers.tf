resource "time_static" "environment_birth" {}

# RBAC settings
data "tfe_team" "team_name_id_lookup" {
  for_each     = var.tfe_team_access_permissions

  name         = each.key
  organization = var.tfe_organization_name
}
