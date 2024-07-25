locals {
  default_enable_services = [
    "cloudbuild.googleapis.com",
    "iam.googleapis.com",
    "run.googleapis.com",
    "serviceusage.googleapis.com",
  ]
}

resource "google_project_service" "cloudresourcemanager" {
  project                    = google_project.project.project_id
  service                    = "cloudresourcemanager.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_service" "enable_services" {
  for_each                   = toset(concat(local.default_enable_services, var.enable_services))
  project                    = google_project.project.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = true
  depends_on                 = [google_project_service.cloudresourcemanager]
}