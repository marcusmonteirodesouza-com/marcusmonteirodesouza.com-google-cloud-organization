module "folders" {
  source = "./modules/folders"

  org_id = var.org_id
}

module "hierarchical_firewall_policies" {
  source = "./modules/hierarchical_firewall_policies"

  environment = var.environment
  org_id      = var.org_id
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
  org_id                               = var.org_id
}

module "projects" {
  source = "./modules/projects"

  billing_account                = var.billing_account
  environment                    = var.environment
  folder_networking_id           = module.folders.networking_id
  folder_production_id           = module.folders.production_id
  org_id                         = var.org_id
  tag_value_id_all_users_ingress = module.tags.all_users_ingress_tag_value_id
}
