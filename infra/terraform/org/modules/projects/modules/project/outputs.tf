output "cloudbuild_sa_email" {
  value = google_service_account.cloudbuild.email
}

output "project_id" {
  value = google_project.project.project_id
}