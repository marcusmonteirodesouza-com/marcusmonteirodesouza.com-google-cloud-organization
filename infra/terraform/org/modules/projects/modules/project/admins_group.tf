locals {
  admins_group_project_roles = [
    "roles/cloudbuild.builds.editor",
    "roles/viewer",
  ]
}

resource "google_project_iam_member" "admins_group" {
  for_each = toset(local.admins_group_project_roles)
  project  = google_project.project.project_id
  role     = each.value
  member   = "group:${var.admins_group_email}"
}