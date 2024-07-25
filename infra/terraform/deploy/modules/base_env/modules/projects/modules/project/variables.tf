variable "admins_group_email" {
  type        = string
  description = "Google Cloud admins group email address."
}

variable "billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account."
}

variable "cloudbuild_sa_project_roles" {
  type        = list(string)
  description = "Cloud Build Service Account project IAM roles."
  default     = []
}

variable "display_name" {
  type        = string
  description = "Project display name."
}

variable "enable_services" {
  type        = list(string)
  description = "Enabled APIs in the project."
  default     = []
}

variable "environment" {
  type        = string
  description = "Environment name (development, nonproduction, production)."
}

variable "folder_id" {
  type        = string
  description = "Folder ID."
}

variable "naming_description" {
  type        = string
  description = "A description to be added to the project's ID."
}

variable "is_shared_vpc_host" {
  type        = bool
  description = "Set to 'true' if the projects is a Shared VPC host."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
}

variable "service_accounts" {
  type        = map(list(string))
  description = "Service Accounts that should be created in the project, with each value containing the list of roles it should have."
  default     = {}
}

variable "shared_vpc_host_cloudbuild_sa_email" {
  type        = string
  description = "Shared VPC host Cloud Build service account email."
  default     = ""
}

variable "shared_vpc_host_project_id" {
  type        = string
  description = "Shared VPC host project ID."
  default     = ""
}

variable "tag_value_id_all_users_ingress" {
  type        = string
  description = "All users ingress tag value ID."
}