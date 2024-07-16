resource "google_project" "project" {
  name                = var.display_name
  project_id          = "${local.naming_prefix}-prj-${var.naming_convention.suffix}"
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  auto_create_network = false
}