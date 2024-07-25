locals {
  cloudbuild_trigger_service_account = "projects/${var.project_id}/serviceAccounts/${var.cloudbuild_sa_email}"
}

module "cloudbuild_trigger_plan_naming" {
  source = "../../../../../modules/naming"

  description = "plan"
  environment = var.environment
  location    = "us-central1"
  resource    = "cloudbuild-trigger"
}

resource "google_cloudbuild_trigger" "plan" {
  name        = module.cloudbuild_trigger_plan_naming.name
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
    _BILLING_ACCOUNT = var.billing_account
    _ENVIRONMENT     = var.environment
    _ORG_ID          = var.org_id
    _TFSTATE_BUCKET  = var.tfstate_bucket
  }
}

module "cloudbuild_trigger_apply_naming" {
  source = "../../../../../modules/naming"

  description = "apply"
  environment = var.environment
  location    = "us-central1"
  resource    = "cloudbuild-trigger"
}

resource "google_cloudbuild_trigger" "apply" {
  name        = module.cloudbuild_trigger_apply_naming.name
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
    _BILLING_ACCOUNT = var.billing_account
    _ENVIRONMENT     = var.environment
    _ORG_ID          = var.org_id
    _TFSTATE_BUCKET  = var.tfstate_bucket
  }
}