resource "google_service_account" "service_accounts" {
  for_each   = var.service_accounts
  project    = google_project.project.project_id
  account_id = "${each.key}-sa"
}

resource "google_project_iam_member" "service_accounts" {
  for_each = tomap({ for role in flatten([for key, roles in var.service_accounts :
    [
      for role in roles :
      {
        service_account = key
        role            = role
      }
  ]]) : "${role.service_account}.${role.role}" => role })
  project = google_project.project.project_id
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.service_accounts[each.value.service_account].email}"
}