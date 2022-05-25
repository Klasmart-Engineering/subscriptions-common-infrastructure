output "tfe_workspace_id" {
  description = "ID of the meta tfe workspace"
  value       = tfe_workspace.workspace.id
}

output "service_owner" {
  description = "Name of the team who owns and manages this deployment."
  value       = var.service_owner
}

output "working_directory" {
  description = "Directory name for the Terraform code."
  value       = var.working_directory
}
