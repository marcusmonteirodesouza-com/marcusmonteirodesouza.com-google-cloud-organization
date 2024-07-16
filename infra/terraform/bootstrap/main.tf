locals {
  naming_suffix = random_id.naming_suffix.hex
}

provider "google" {
  project = var.project_id
  region  = "northamerica-northeast1"
}

resource "random_id" "naming_suffix" {
  byte_length = 2
}

module "enable_services" {
  source = "./modules/enable_services"
}

module "iam" {
  source = "./modules/iam"

  billing_account = var.billing_account
  naming_convention = {
    environment_code = var.naming_convention.environment_code
    prefix           = var.naming_convention.prefix
    suffix           = local.naming_suffix
    project          = var.naming_convention.project
  }
  project_id = var.project_id
  org_id     = var.org_id

  depends_on = [
    module.enable_services
  ]
}

module "cloudbuild" {
  source = "./modules/cloudbuild"

  billing_account     = var.billing_account
  cloudbuild_sa_email = module.iam.cloudbuild_sa_email
  github_repo_owner   = var.github_repo_owner
  github_repo_name    = var.github_repo_name
  naming_convention = {
    environment_code = var.naming_convention.environment_code
    prefix           = var.naming_convention.prefix
    suffix           = local.naming_suffix
    project          = var.naming_convention.project
  }
  org_id         = var.org_id
  project_id     = var.project_id
  tfstate_bucket = var.tfstate_bucket
}
