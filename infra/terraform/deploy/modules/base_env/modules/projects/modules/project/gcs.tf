module "storage_bucket_tfstate_naming" {
  source = "../../../../../../../modules/naming"

  description = "tfstate"
  environment = var.environment
  location    = "northamerica-northeast1"
  project     = var.naming_description
  resource    = "gcs-bucket"
}

resource "google_storage_bucket" "tfstate" {
  project  = google_project.project.project_id
  name     = module.storage_bucket_tfstate_naming.name
  location = "northamerica-northeast1"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
