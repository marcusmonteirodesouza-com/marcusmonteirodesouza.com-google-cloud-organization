locals {
  admins_group_project_roles = [
    "roles/cloudbuild.builds.editor",
    "roles/viewer",
  ]

  admins_group_cloudbuild_sa_roles = [
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountUser"
  ]
}

resource "google_project_iam_member" "admins_group" {
  for_each = toset(local.admins_group_project_roles)
  project  = google_project.project.project_id
  role     = each.value
  member   = "group:${var.admins_group_email}"
}

resource "google_storage_bucket_iam_member" "admins_group_tfstate" {
  bucket = google_storage_bucket.tfstate.name
  role   = "roles/storage.objectUser"
  member = "group:${var.admins_group_email}"
}

resource "google_service_account_iam_member" "admins_group_cloudbuild_sa" {
  for_each           = toset(local.admins_group_cloudbuild_sa_roles)
  service_account_id = google_service_account.cloudbuild.id
  role               = each.value
  member             = "group:${var.admins_group_email}"
}