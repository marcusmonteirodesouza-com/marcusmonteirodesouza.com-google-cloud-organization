terraform {
  backend "gcs" {
    # bucket = "" # This needs to be passed as backend-config.
    prefix       = "org"
    lock_timeout = "60m"
  }
}