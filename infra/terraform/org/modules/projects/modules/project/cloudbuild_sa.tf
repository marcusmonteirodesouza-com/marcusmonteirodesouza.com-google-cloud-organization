locals {
  cloudbuild_sa_default_project_roles = [
    "roles/cloudbuild.builds.editor",
    "roles/compute.loadBalancerAdmin",
    "roles/logging.logWriter"
  ]
}

resource "google_service_account" "cloudbuild" {
  project      = google_project.project.project_id
  account_id   = "cloudbuild-sa"
  display_name = "Cloud Build Service Account"
}

resource "google_tags_tag_value_iam_member" "tag_value_ids_cloudbuild_sa" {
  for_each  = toset(var.tag_value_ids)
  tag_value = each.value
  role      = "roles/resourcemanager.tagUser"
  member    = "serviceAccount:${google_service_account.cloudbuild.email}"
}

resource "google_project_iam_member" "cloudbuild_sa" {
  for_each = toset(concat(local.cloudbuild_sa_default_project_roles, var.cloudbuild_sa_project_roles))
  project  = google_project.project.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.cloudbuild.email}"
}

resource "google_storage_bucket_iam_member" "cloudbuild_sa_tfstate" {
  bucket = google_storage_bucket.tfstate.name
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.cloudbuild.email}"
}