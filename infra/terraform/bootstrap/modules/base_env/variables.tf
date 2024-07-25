variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
}

variable "environment" {
  type        = string
  description = "Environment name (development, nonproduction, production)."
}

variable "github_repo_owner" {
  type        = string
  description = "Github repository owner."
}

variable "github_repo_name" {
  type        = string
  description = "Github repository name."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
}

variable "project_id" {
  type        = string
  description = "The project ID."
}

variable "tfstate_bucket" {
  type        = string
  description = "Terraform state GCS backend bucket name."
}