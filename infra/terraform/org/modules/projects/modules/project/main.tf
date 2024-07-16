locals {
  naming_prefix = "${var.naming_convention.prefix}-${var.naming_convention.project}-${var.naming_convention.environment_code}"
}

resource "google_project_service_identity" "cloudrun_sa" {
  provider = google-beta
  project  = google_project.project.project_id
  service  = "run.googleapis.com"

  depends_on = [
    google_project_service.enable_services
  ]
}