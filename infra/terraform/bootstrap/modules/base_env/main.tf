module "enable_services" {
  source = "./modules/enable_services"
}

module "iam" {
  source = "./modules/iam"

  billing_account = var.billing_account
  project_id      = var.project_id
  org_id          = var.org_id
  tfstate_bucket  = var.tfstate_bucket

  depends_on = [
    module.enable_services
  ]
}

module "cloudbuild" {
  source = "./modules/cloudbuild"

  billing_account     = var.billing_account
  cloudbuild_sa_email = module.iam.cloudbuild_sa_email
  environment         = var.environment
  github_repo_owner   = var.github_repo_owner
  github_repo_name    = var.github_repo_name
  org_id              = var.org_id
  project_id          = var.project_id
  tfstate_bucket      = var.tfstate_bucket
}
