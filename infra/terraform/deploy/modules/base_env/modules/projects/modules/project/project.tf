module "project_naming" {
  source = "../../../../../../../modules/naming"

  description = var.naming_description
  environment = var.environment
  project     = var.naming_description
  resource    = "project"
}

resource "google_project" "project" {
  name                = var.display_name
  project_id          = module.project_naming.name
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  auto_create_network = false
}