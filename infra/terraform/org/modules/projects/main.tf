locals {
  environment_code_development   = "d"
  environment_code_nonproduction = "n"
  environment_code_production    = "p"
}

data "google_organization" "org" {
  organization = var.org_id
}