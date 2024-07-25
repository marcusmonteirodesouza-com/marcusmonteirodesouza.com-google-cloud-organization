variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
}

variable "environment" {
  type        = string
  description = "Environment name (development, nonproduction, production)."
}

variable "folder_networking_id" {
  type        = string
  description = "Networking folder ID."
}

variable "folder_production_id" {
  type        = string
  description = "Production folder Id."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
}

variable "tag_value_id_all_users_ingress" {
  type        = string
  description = "All users ingress tag value ID."
}