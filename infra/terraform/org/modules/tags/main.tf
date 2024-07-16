resource "google_tags_tag_key" "all_users_ingress" {
  parent     = "organizations/${var.org_id}"
  short_name = "allUsersIngress"
}

resource "google_tags_tag_value" "all_users_ingress" {
  parent      = "tagKeys/${google_tags_tag_key.all_users_ingress.name}"
  short_name  = "allUsersIngress"
  description = "Allow for allUsers"
}