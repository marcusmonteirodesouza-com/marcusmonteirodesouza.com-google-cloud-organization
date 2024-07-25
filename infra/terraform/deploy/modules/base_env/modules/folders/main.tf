resource "google_folder" "networking" {
  display_name = "Networking"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "production" {
  display_name = "Production"
  parent       = "organizations/${var.org_id}"
}