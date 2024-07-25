variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
}

variable "github_repo_owner" {
  type        = string
  description = "Github repository owner."
  default     = "marcusmonteirodesouza-com"
}

variable "github_repo_name" {
  type        = string
  description = "Github repository name."
  default     = "marcusmonteirodesouza.com-google-cloud-organization"
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