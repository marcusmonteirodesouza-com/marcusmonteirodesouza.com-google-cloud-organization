locals {
  host_service_cloudbuild_sa_roles = [
    "roles/compute.networkUser",
    "roles/vpcaccess.viewer"
  ]

  service_host_cloudbuild_sa_roles = [
    "roles/compute.loadBalancerServiceUser"
  ]
}

resource "google_compute_shared_vpc_host_project" "host" {
  count   = var.is_shared_vpc_host ? 1 : 0
  project = google_project.project.project_id
}

resource "google_compute_shared_vpc_service_project" "service" {
  count           = var.is_shared_vpc_host ? 0 : 1
  host_project    = var.shared_vpc_host_project_id
  service_project = google_project.project.project_id
}

resource "google_project_iam_member" "cloudbuild_sa_host_service" {
  for_each = { for key, value in toset(local.host_service_cloudbuild_sa_roles) : key => value if !var.is_shared_vpc_host }
  project  = var.shared_vpc_host_project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.cloudbuild.email}"
}

resource "google_project_iam_member" "cloudrun_sa_host_service" {
  count   = var.is_shared_vpc_host ? 0 : 1
  project = var.shared_vpc_host_project_id
  role    = "roles/vpcaccess.user"
  member  = "serviceAccount:${google_project_service_identity.cloudrun_sa.email}"
}

resource "google_project_iam_member" "shared_vpc_host_cloudbuild_sa_service_host" {
  for_each = { for key, value in toset(local.service_host_cloudbuild_sa_roles) : key => value if !var.is_shared_vpc_host }
  project  = google_project.project.project_id
  role     = each.value
  member   = "serviceAccount:${var.shared_vpc_host_cloudbuild_sa_email}"
}