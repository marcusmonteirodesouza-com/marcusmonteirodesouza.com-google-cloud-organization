variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
  sensitive   = true
}

variable "github_repo_owner" {
  type        = string
  description = "Github repository owner."
}

variable "github_repo_name" {
  type        = string
  description = "Github repository name."
}

variable "naming_convention" {
  type = object({
    environment_code = string
    prefix           = string
    project          = string
  })
  description = "Resource naming convention."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
  sensitive   = true
}

variable "project_id" {
  type        = string
  description = "The project ID."
  sensitive   = true
}

variable "tfstate_bucket" {
  type        = string
  description = "Terraform state GCS backend bucket name."
  sensitive   = true
}