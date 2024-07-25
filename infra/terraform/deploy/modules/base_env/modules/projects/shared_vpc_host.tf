locals {
  shared_vpc_host_project_display_name_prefix = "Shared VPC Host"

  shared_vpc_host_project_naming_description = "sharedvpchost"
}

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
  environment                    = var.environment
  folder_id                      = var.folder_networking_id
  is_shared_vpc_host             = true
  naming_description             = local.shared_vpc_host_project_naming_description
  org_id                         = var.org_id
  tag_value_id_all_users_ingress = var.tag_value_id_all_users_ingress
}