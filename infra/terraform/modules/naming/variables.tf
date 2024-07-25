variable "description" {
  type        = string
  description = "Short description without spaces."
}

variable "environment" {
  type        = string
  description = "Environment name (development, nonproduction, production)."
}

variable "location" {
  type        = string
  description = "Resource location."
  default     = null
}

variable "project" {
  type        = string
  description = "Short project description."
  default     = "bootstrap"
}

variable "resource" {
  type        = string
  description = "Resource type."
}
