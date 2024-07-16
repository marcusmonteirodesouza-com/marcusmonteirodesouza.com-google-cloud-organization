variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
  sensitive   = true
}

variable "naming_convention_environment_code" {
  type        = string
  description = "Resource naming convention environment code."
}

variable "naming_convention_prefix" {
  type        = string
  description = "Resource naming convention prefix."
}

variable "naming_convention_suffix" {
  type        = string
  description = "Resource naming convention suffix."
}

variable "naming_convention_project" {
  type        = string
  description = "Resource naming convention project."
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