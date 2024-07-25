variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
}

variable "environment" {
  type        = string
  description = "Environment name (development, nonproduction, production)."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
}

variable "project_id" {
  type        = string
  description = "The project ID."
}