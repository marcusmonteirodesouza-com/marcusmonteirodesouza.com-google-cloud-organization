module "organization_security_policy_common_firewall_rules_naming" {
  source = "../../../../../modules/naming"

  description = "commonfwrules"
  environment = var.environment
  resource    = "organization-security-policy"
}

resource "google_compute_organization_security_policy" "common_firewall_rules" {
  provider     = google-beta
  display_name = module.organization_security_policy_common_firewall_rules_naming.name
  parent       = "organizations/${var.org_id}"
  type         = "FIREWALL"
}

module "organization_security_policy_association_common_firewall_rules_naming" {
  source = "../../../../../modules/naming"

  description = "commonfwrules"
  environment = var.environment
  resource    = "organization-security-policy-association"
}

resource "google_compute_organization_security_policy_association" "common_firewall_rules" {
  provider      = google-beta
  name          = module.organization_security_policy_association_common_firewall_rules_naming.name
  policy_id     = google_compute_organization_security_policy.common_firewall_rules.id
  attachment_id = google_compute_organization_security_policy.common_firewall_rules.parent
}

# See https://cloud.google.com/iap/docs/using-tcp-forwarding#create-firewall-rule
resource "google_compute_organization_security_policy_rule" "common_firewall_rules_allow_iap_ssh_rdp" {
  provider = google-beta

  policy_id = google_compute_organization_security_policy.common_firewall_rules.id
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
resource "google_compute_organization_security_policy_rule" "common_firewall_rules_allow_google_hbs_and_hcs" {
  provider = google-beta

  policy_id = google_compute_organization_security_policy.common_firewall_rules.id
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