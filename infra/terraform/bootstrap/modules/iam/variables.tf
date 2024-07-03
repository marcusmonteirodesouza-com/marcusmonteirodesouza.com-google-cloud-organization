variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
  sensitive   = true
}

variable "naming_prefix" {
  type        = string
  description = "Resource naming prefix."
}

variable "naming_suffix" {
  type        = string
  description = "Resource naming suffix."
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