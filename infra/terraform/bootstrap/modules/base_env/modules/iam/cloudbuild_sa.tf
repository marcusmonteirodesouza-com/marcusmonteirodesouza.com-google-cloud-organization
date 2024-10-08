locals {
  cloudbuild_sa_billing_account_roles = [
    "roles/billing.user",
  ]

  cloudbuild_sa_org_roles = [
    "roles/compute.orgSecurityResourceAdmin",
    "roles/compute.securityAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.organizationViewer",
    "roles/resourcemanager.projectCreator",
    "roles/resourcemanager.projectDeleter",
    "roles/resourcemanager.tagAdmin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/storage.admin",
  ]

  cloudbuild_sa_project_roles = [
    "roles/logging.logWriter",
    "roles/serviceusage.serviceUsageConsumer"
  ]
}

resource "google_service_account" "cloudbuild" {
  account_id   = "cloudbuild-sa"
  display_name = "Cloud Build Service Account"
}

resource "google_billing_account_iam_member" "cloudbuild_sa" {
  for_each           = toset(local.cloudbuild_sa_billing_account_roles)
  billing_account_id = var.billing_account
  role               = each.value
  member             = "serviceAccount:${google_service_account.cloudbuild.email}"
}

resource "google_organization_iam_member" "cloudbuild_sa" {
  for_each = toset(local.cloudbuild_sa_org_roles)
  org_id   = var.org_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.cloudbuild.email}"
}

resource "google_project_iam_member" "cloudbuild_sa" {
  for_each = toset(local.cloudbuild_sa_project_roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.cloudbuild.email}"
}

resource "google_storage_bucket_iam_member" "cloudbuild_sa_tfstate_bucket" {
  bucket = var.tfstate_bucket
  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.cloudbuild.email}"
}