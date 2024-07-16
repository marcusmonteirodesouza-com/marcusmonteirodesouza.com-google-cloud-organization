locals {
  enabled_apis = [
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "orgpolicy.googleapis.com",
    "secretmanager.googleapis.com",
  ]
}

resource "google_project_service" "enable_services" {
  for_each                   = toset(local.enabled_apis)
  service                    = each.value
  disable_dependent_services = false
  disable_on_destroy         = false
}