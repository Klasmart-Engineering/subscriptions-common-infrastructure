variable workspace_name {
    description = "The workspace name"
    type        = string
}

variable workspace_description {
    description = "A brief description for the offering"
    type        = string
    default     = "Offering workspace"
}

variable env_repo {
    description = "Service/Offering environment repo"
    type        = string
}

# External sources variables
variable "env_repo_default_branch" {
  description = "Default branch to deploy env repos from with Github VCS connection"
  type        = string
  default     = "main"
}

# TFC variables
variable "terraform_version" {
  description = "Version of terraform to set up workspaces with"
  type        = string
  default     = "1.1.7"
}

variable "tfe_deploy_ssh_key_id" {
  description = "Name of the SSH key to authenticate with for Git-SSH based service module imports"
  type        = string
  default     = "TFC GitHub"
}

variable "vcs_oauth_token_id" {
  description = "ID of the VCS OAuth token to use for configuring git-trigger automated updates"
  type        = string
  default     = "ot-d4J8jBXB89U1bwzw"
}

variable "tfe_team_access_permissions" {
  description = "Map of team names to permissions levels for the teams who are allowed access to workspaces for this environment."
  type        = map
  default     = {
    "Infrastructure" = "admin"
  }
}

variable "tfe_organization_name" {
  description = "Name of the Terraform Cloud org"
  type        = string
  default     = "kidsloop-infrastructure"
}

# Notification settings
variable "notify_name" {
  description = "Name of the Slack channel to notify to."
  type        = string
  default     = "infra-terraform-cloud"
}
variable "notify_enabled" {
  description = "If set, will enable notifications."
  type        = bool
  default     = false
}
variable "notify_triggers" {
  description = "List of triggers for which to generate notifications."
  type        = list(string)
  default     = [
    "run:created",
    "run:planning",
    "run:needs_attention",
    "run:applying",
    "run:completed",
    "run:errored"
  ]
}
variable "notify_url" {
  description = "Webhook URL to send the notification to."
  type        = string
  default     = "https://hooks.slack.com/services/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"
}

## Passthrough variables
# Basic project variables
variable "region" {
  description = "Cloud provider region name"
  type        = string
}

variable "project_environment" {
  description = "Business name of Kidsloop environment (e.g. test)"
  type        = string
}

variable "project_region" {
  description = "Business name of Kidsloop region (e.g. uk/in/id/vn etc)"
  type        = string
}

variable "service_owner" {
  description = "Owner of deployment (which team manages?)"
  type        = string
}

variable "domain" {
  description = "Domain name of environment (e.g. stage.kidsloop.live)"
  type        = string
}

variable "tags" {
  description = "Set of tags to apply to all resources"
  type        = map(any)
  default     = {}
}

variable "working_directory" {
  description = "The location of the terraform files for the environment"
  type        = string
  default     = ""
}

variable "allow_destroy_plan" {
  description = "Allow a destroy plan to be created"
  type = bool
  default = true
}