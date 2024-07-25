locals {
  homepage_project_display_name_prefix = "Home Page"

  homepage_project_naming_description = "homepage"
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
  environment        = var.environment
  folder_id          = var.folder_production_id
  is_shared_vpc_host = false
  naming_description = local.homepage_project_naming_description
  org_id             = var.org_id
  service_accounts = {
    resume-generator-cf = [
      "roles/aiplatform.user",
      "roles/logging.logWriter"
    ]
    web-frontend = [
      "roles/logging.logWriter"
    ]
  }
  shared_vpc_host_cloudbuild_sa_email = module.shared_vpc_host_production.cloudbuild_sa_email
  shared_vpc_host_project_id          = module.shared_vpc_host_production.project_id
  tag_value_id_all_users_ingress      = var.tag_value_id_all_users_ingress
}