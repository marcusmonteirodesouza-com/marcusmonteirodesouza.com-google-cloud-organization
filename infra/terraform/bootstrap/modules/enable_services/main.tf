locals {
  enabled_apis = [
    "cloudbuild.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}

resource "google_project_service" "enable_apis" {
  for_each                   = toset(local.enabled_apis)
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}