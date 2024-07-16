locals {
  cloudbuild_trigger_service_account = "projects/${var.project_id}/serviceAccounts/${var.cloudbuild_sa_email}"
}

resource "google_cloudbuild_trigger" "plan" {
  name        = "${local.naming_prefix}-us-c1-cbt-plan-${var.naming_convention.suffix}"
  description = "Plan - ${var.github_repo_owner}/${var.github_repo_name} PR to 'main'"
  location    = "us-central1"

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
    _BILLING_ACCOUNT                    = var.billing_account
    _NAMING_CONVENTION_ENVIRONMENT_CODE = var.naming_convention.environment_code
    _NAMING_CONVENTION_PREFIX           = var.naming_convention.prefix
    _NAMING_CONVENTION_SUFFIX           = var.naming_convention.suffix
    _NAMING_CONVENTION_PROJECT          = var.naming_convention.project
    _ORG_ID                             = var.org_id
    _TFSTATE_BUCKET                     = var.tfstate_bucket
  }
}

resource "google_cloudbuild_trigger" "apply" {
  name        = "${local.naming_prefix}-us-c1-cbt-apply-${var.naming_convention.suffix}"
  description = "Apply - ${var.github_repo_owner}/${var.github_repo_name} push to 'main'"
  location    = "us-central1"

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
    _BILLING_ACCOUNT                    = var.billing_account
    _NAMING_CONVENTION_ENVIRONMENT_CODE = var.naming_convention.environment_code
    _NAMING_CONVENTION_PREFIX           = var.naming_convention.prefix
    _NAMING_CONVENTION_SUFFIX           = var.naming_convention.suffix
    _NAMING_CONVENTION_PROJECT          = var.naming_convention.project
    _ORG_ID                             = var.org_id
    _TFSTATE_BUCKET                     = var.tfstate_bucket
  }
}