variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
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