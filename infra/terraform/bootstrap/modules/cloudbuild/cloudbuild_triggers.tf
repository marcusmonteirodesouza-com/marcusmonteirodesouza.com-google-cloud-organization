locals {
  cloudbuild_trigger_service_account = "projects/${var.project_id}/serviceAccounts/${var.cloudbuild_sa_email}"
}

resource "google_cloudbuild_trigger" "plan" {
  name        = "${var.naming_prefix}-na-ne1-cbt-plan-${var.naming_suffix}"
  description = "Plan - ${var.github_repo_owner}/${var.github_repo_name} PR to 'main'"
  location    = "northamerica-northeast1"

  service_account = local.cloudbuild_trigger_service_account

  filename = "infra/cloudbuild/cloudbuild.plan.yaml"

  github {
    owner = var.github_repo_owner
    name  = var.github_repo_name
    pull_request {
      branch = "^main$"
    }
  }


  substitutions = {
    _BILLING_ACCOUNT = var.billing_account
    _ORG_ID          = var.org_id
    _TFSTATE_BUCKET  = var.tfstate_bucket
  }
}

resource "google_cloudbuild_trigger" "apply" {
  name        = "${var.naming_prefix}-na-ne1-cbt-apply-${var.naming_suffix}"
  description = "Apply - ${var.github_repo_owner}/${var.github_repo_name} push to 'main'"
  location    = "northamerica-northeast1"

  service_account = local.cloudbuild_trigger_service_account

  filename = "infra/cloudbuild/cloudbuild.apply.yaml"

  github {
    owner = var.github_repo_owner
    name  = var.github_repo_name
    push {
      branch = "^main$"
    }
  }


  substitutions = {
    _BILLING_ACCOUNT = var.billing_account
    _ORG_ID          = var.org_id
    _TFSTATE_BUCKET  = var.tfstate_bucket
  }
}