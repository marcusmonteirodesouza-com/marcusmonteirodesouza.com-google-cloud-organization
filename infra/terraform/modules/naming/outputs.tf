output "name" {
  value = replace("${local.prefix}-${var.project}-${local.environment_code}-${local.resource_abbreviation}-${local.location_abbreviation}-${local.description}-${local.suffix}", "/-+/", "-")
}

