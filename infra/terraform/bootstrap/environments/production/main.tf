provider "google" {
  project = var.project_id
  region  = "northamerica-northeast1"
}

module "base_env" {
  source = "../../modules/base_env"

  billing_account   = var.billing_account
  environment       = "production"
  github_repo_owner = var.github_repo_owner
  github_repo_name  = var.github_repo_name
  org_id            = var.org_id
  project_id        = var.project_id
  tfstate_bucket    = var.tfstate_bucket
}