resource "google_project_service_identity" "cloudrun_sa" {
  provider = google-beta
  project  = google_project.project.project_id
  service  = "run.googleapis.com"

  depends_on = [
    google_project_service.enable_services
  ]
}