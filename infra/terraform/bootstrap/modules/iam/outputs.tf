output "cloudbuild_sa_email" {
  value       = google_service_account.cloudbuild.email
  description = "Cloud Build service account email."
}