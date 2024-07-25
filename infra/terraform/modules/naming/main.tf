locals {
  description = var.resource == "project" ? "" : var.description

  environment_code_map = {
    "development"   = "d"
    "nonproduction" = "n"
    "production"    = "p"
  }

  environment_code = lookup(local.environment_code_map, var.environment, "d")

  location_map = {
    "global"                  = "glbl"
    "northamerica-northeast1" = "na-ne1"
    "us"                      = "us"
    "us-central1"             = "us-ctl1"
  }

  location_abbreviation = var.location == null ? "" : lookup(local.location_map, var.location, null)

  prefix = "mms"

  resource_abbreviation_map = {
    "cloudbuild-trigger"                       = "cbt"
    "gcs-bucket"                               = "bkt"
    "organization-security-policy"             = "orgsecplcy"
    "organization-security-policy-association" = "orgsecplcyassoc"
    "project"                                  = "prj"
  }

  resource_abbreviation = lookup(local.resource_abbreviation_map, var.resource, null)

  suffix = random_id.naming_suffix.hex
}

resource "random_id" "naming_suffix" {
  byte_length = 2
}