variable "folder_networking_id" {
  type        = string
  description = "Networking folder ID."
}

variable "org_id" {
  type        = string
  description = "The numeric ID of the organization."
  sensitive   = true
}