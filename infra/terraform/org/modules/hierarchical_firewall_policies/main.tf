locals {
  naming_prefix = "${var.naming_convention.prefix}-${var.naming_convention.project}-${var.naming_convention.environment_code}"
}

resource "google_compute_organization_security_policy" "common" {
  provider     = google-beta
  display_name = "${local.naming_prefix}-common-firewall-rules-${var.naming_convention.suffix}"
  parent       = "organizations/${var.org_id}"
}

resource "google_compute_organization_security_policy_association" "common" {
  provider      = google-beta
  name          = "${google_compute_organization_security_policy.common.id}-org"
  policy_id     = google_compute_organization_security_policy.common.id
  attachment_id = google_compute_organization_security_policy.common.parent
}

# See https://cloud.google.com/iap/docs/using-tcp-forwarding#create-firewall-rule
resource "google_compute_organization_security_policy_rule" "common_allow_iap_ssh_rdp" {
  provider = google-beta

  policy_id = google_compute_organization_security_policy.common.id
  action    = "allow"
  direction = "INGRESS"
  priority  = 5000
  match {
    description = "Always allow SSH and RDP from IAP"
    config {
      src_ip_ranges = [
        "35.235.240.0/20"
      ]
      layer4_config {
        ip_protocol = "tcp"
        ports = [
          "22",
          "3389"
        ]
      }
    }
  }
  enable_logging = true
}

# See https://cloud.google.com/load-balancing/docs/health-checks#fw-rule
resource "google_compute_organization_security_policy_rule" "common_allow_google_hbs_and_hcs" {
  provider = google-beta

  policy_id = google_compute_organization_security_policy.common.id
  action    = "allow"
  direction = "INGRESS"
  priority  = 5200
  match {
    description = "Always allow connections from Google load balancer and health check ranges"
    config {
      src_ip_ranges = [
        "35.191.0.0/16",
        "130.211.0.0/22",
        "209.85.152.0/22",
        "209.85.204.0/22"
      ]
      layer4_config {
        ip_protocol = "tcp"
        ports = [
          "80",
          "443"
        ]
      }
    }
  }
  enable_logging = true
}