resource "google_storage_bucket" "tfstate" {
  project  = google_project.project.project_id
  name     = "${local.naming_prefix}-bkt-tfstate-${var.naming_convention.suffix}"
  location = "northamerica-northeast1"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "cloudbuild_sa_tfstate" {
  bucket = google_storage_bucket.tfstate.name
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.cloudbuild.email}"
}