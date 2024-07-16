locals {
  naming_shared_vpc_host_project              = "shr-vpc-host"
  shared_vpc_host_project_display_name_prefix = "Shared VPC Host"
}

# TODO(Marcus): Uncomment when we have more environments
# module "shared_vpc_host_development" {
#   source = "./modules/project"

#   admins_group_email = "networking-administrators-development@${data.google_organization.org.domain}"
#   billing_account    = var.billing_account
#   cloudbuild_sa_project_roles = [
#     "roles/compute.networkAdmin",
#     "roles/compute.securityAdmin",
#     "roles/vpcaccess.admin"
#   ]
#   display_name = "${local.shared_vpc_host_project_display_name_prefix} - Development"
#   enable_services = [
#     "compute.googleapis.com",
#     "servicenetworking.googleapis.com",
#     "vpcaccess.googleapis.com"
#   ]
#   folder_id          = var.folder_networking_id
#   is_shared_vpc_host = true
#   naming_convention = {
#     environment_code = local.environment_code_development
#     prefix           = var.naming_convention.prefix
#     suffix           = var.naming_convention.suffix
#     project          = local.naming_shared_vpc_host_project
#   }
#   org_id        = var.org_id
#   tag_value_ids = var.tag_value_ids
# }

# module "shared_vpc_host_nonproduction" {
#   source = "./modules/project"

#   admins_group_email = "networking-administrators-nonproduction@${data.google_organization.org.domain}"
#   billing_account    = var.billing_account
#   cloudbuild_sa_project_roles = [
#     "roles/compute.networkAdmin",
#     "roles/compute.securityAdmin",
#     "roles/vpcaccess.admin"
#   ]
#   display_name = "${local.shared_vpc_host_project_display_name_prefix} - NonProduction"
#   enable_services = [
#     "compute.googleapis.com",
#     "servicenetworking.googleapis.com",
#     "vpcaccess.googleapis.com"
#   ]
#   folder_id          = var.folder_networking_id
#   is_shared_vpc_host = true
# naming_convention  = {
#     environment_code = local.environment_code_nonproduction
#     prefix = var.naming_convention.prefix
#     suffix = var.naming_convention.suffix
#     project = local.naming_shared_vpc_host_project
#   }
#   org_id             = var.org_id
#   tag_value_ids         = var.tag_value_ids
# }

module "shared_vpc_host_production" {
  source = "./modules/project"

  admins_group_email = "networking-administrators-production@${data.google_organization.org.domain}"
  billing_account    = var.billing_account
  cloudbuild_sa_project_roles = [
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/vpcaccess.admin"
  ]
  display_name = "${local.shared_vpc_host_project_display_name_prefix} - Production"
  enable_services = [
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "vpcaccess.googleapis.com"
  ]
  folder_id          = var.folder_networking_id
  is_shared_vpc_host = true
  naming_convention = {
    environment_code = local.environment_code_production
    prefix           = var.naming_convention.prefix
    suffix           = var.naming_convention.suffix
    project          = local.naming_shared_vpc_host_project
  }
  org_id        = var.org_id
  tag_value_ids = var.tag_value_ids
}