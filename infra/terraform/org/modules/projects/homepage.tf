locals {
  naming_homepage_project              = "homepage"
  homepage_project_display_name_prefix = "Home Page"
}

module "homepage_production" {
  source = "./modules/project"

  admins_group_email = "homepage-administrators-production@${data.google_organization.org.domain}"
  billing_account    = var.billing_account
  cloudbuild_sa_project_roles = [
    "roles/run.admin",
  ]
  display_name = "${local.homepage_project_display_name_prefix} - Production"
  enable_services = [
    "aiplatform.googleapis.com",
    "cloudfunctions.googleapis.com"
  ]
  folder_id          = var.folder_production_id
  is_shared_vpc_host = false
  naming_convention = {
    environment_code = local.environment_code_production
    prefix           = var.naming_convention.prefix
    suffix           = var.naming_convention.suffix
    project          = local.naming_homepage_project
  }
  org_id = var.org_id
  service_accounts = {
    resume-generator-cf = [
      "roles/aiplatform.user"
    ]
    web-frontend = [
      "roles/logging.logWriter"
    ]
  }
  shared_vpc_host_cloudbuild_sa_email = module.shared_vpc_host_production.cloudbuild_sa_email
  shared_vpc_host_project_id          = module.shared_vpc_host_production.project_id
  tag_value_ids                       = var.tag_value_ids
}