locals {
  folder_prefix = "${var.naming_convention.prefix}-fldr"
}

resource "google_folder" "networking" {
  display_name = "${local.folder_prefix}-ntwrk"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "development" {
  display_name = "${local.folder_prefix}-d"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "nonproduction" {
  display_name = "${local.folder_prefix}-n"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "production" {
  display_name = "${local.folder_prefix}-p"
  parent       = "organizations/${var.org_id}"
}