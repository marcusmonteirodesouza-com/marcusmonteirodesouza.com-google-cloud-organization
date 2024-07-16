locals {
  naming_convention = {
    environment_code = var.naming_convention_environment_code
    prefix           = var.naming_convention_prefix
    suffix           = var.naming_convention_suffix
    project          = var.naming_convention_project
  }
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

module "org_policies" {
  source = "./modules/org_policies"

  folder_networking_id = module.folders.networking_id
  org_id               = var.org_id
}

module "tags" {
  source = "./modules/tags"

  org_id = var.org_id
}