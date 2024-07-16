variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
  sensitive   = true
}

variable "folder_networking_id" {
  type        = string
  description = "Networking folder ID."
}

variable "folder_production_id" {
  type        = string
  description = "Production folder Id."
}

variable "naming_convention" {
  type = object({
    environment_code = string
    prefix           = string
    suffix           = string
    project          = string
  })
  description = "Resource naming convention."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
  sensitive   = true
}

variable "tag_value_ids" {
  type        = list(string)
  description = "Tag value IDs."
}