data "tfe_ssh_key" "deploy" {
  name         = var.tfe_deploy_ssh_key_id
  organization = var.tfe_organization_name
}
