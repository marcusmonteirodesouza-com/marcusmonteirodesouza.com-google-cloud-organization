provider "google" {
  project               = var.project_id
  region                = "northamerica-northeast1"
  user_project_override = true
  billing_project       = var.project_id
}

provider "google-beta" {
  project               = var.project_id
  region                = "northamerica-northeast1"
  user_project_override = true
  billing_project       = var.project_id
}

module "base_env" {
  source = "../../modules/base_env"

  billing_account = var.billing_account
  environment     = "production"
  org_id          = var.org_id
  project_id      = var.project_id
}