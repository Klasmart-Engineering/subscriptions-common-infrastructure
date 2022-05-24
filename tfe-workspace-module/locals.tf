locals {
  tfe_tags = [
    "reg:${lower(var.region)}",
    "env:${lower(var.project_environment)}",
    "loc:${lower(var.project_region)}",
    "own:${lower(var.service_owner)}",
    "dom:${replace(var.domain, ".", "-")}",
  ]
  working_directory = var.working_directory == "" ? var.project_environment : var.working_directory
}

locals {
  # Passthrough variables
  region              = var.region
  project_environment = var.project_environment
  project_region      = var.project_region
  service_owner       = var.service_owner
  domain              = var.domain
  # parent_domain       = var.parent_domain
}

locals {
  # Provider Tags
  provider_tags = {
    "REGION"           = "${lower(var.region)}"
    "ENVIRONMENT"      = "${lower(var.project_environment)}"
    "LOCALE"           = "${lower(var.project_region)}"
    "OWNER_GROUP"      = "${var.service_owner}"
    "OWNER_SUB_GROUP"  = "${var.service_owner}"
    "DOMAIN"           = "${lower(var.domain)}"
    "RESOURCE_GROUP"   = "Misc"
    "SERVICE_GROUP"    = "Misc"
    "DATE_CREATED"     = formatdate("DD MMM YYYY hh:mm ZZZ", time_static.environment_birth.rfc3339)
    "DATE_CREATED_RFC" = time_static.environment_birth.rfc3339
  }
}
