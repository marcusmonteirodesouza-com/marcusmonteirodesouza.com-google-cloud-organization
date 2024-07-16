locals {
  naming_convention = {
    environment_code = var.naming_convention_environment_code
    prefix           = var.naming_convention_prefix
    suffix           = var.naming_convention_suffix
    project          = var.naming_convention_project
  }
}

provider "google" {
  project               = var.project_id
  region                = "northamerica-northeast1"
  user_project_override = true
  billing_project       = var.project_id
}

provider "google-beta" {
  project               = var.project_id
  region                = "northamerica-northeast1"
  user_project_override = true
  billing_project       = var.project_id
}

module "folders" {
  source = "./modules/folders"

  naming_convention = local.naming_convention
  org_id            = var.org_id
}

module "hierarchical_firewall_policies" {
  source = "./modules/hierarchical_firewall_policies"

  naming_convention = local.naming_convention
  org_id            = var.org_id
}

module "tags" {
  source = "./modules/tags"

  org_id = var.org_id
}

module "org_policies" {
  source = "./modules/org_policies"

  all_users_ingress_tag_key_id         = module.tags.all_users_ingress_tag_key_id
  all_users_ingress_tag_key_short_name = module.tags.all_users_ingress_tag_key_short_name
  all_users_ingress_tag_value_id       = module.tags.all_users_ingress_tag_value_id
  folder_networking_id                 = module.folders.networking_id
  org_id                               = var.org_id
}

