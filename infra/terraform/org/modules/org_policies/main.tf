locals {
  org_policy_name_prefix = "organizations/${var.org_id}/policies"

  org_policy_parent = "organizations/${var.org_id}"
}

data "google_organization" "org" {
  organization = var.org_id
}

resource "google_org_policy_policy" "ainotebooks_restrictPublicIp" {
  name   = "${local.org_policy_name_prefix}/ainotebooks.restrictPublicIp"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "appengine_disableCodeDownload" {
  name   = "${local.org_policy_name_prefix}/appengine.disableCodeDownload"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "cloudbuild_disableCreateDefaultServiceAccount" {
  name   = "${local.org_policy_name_prefix}/cloudbuild.disableCreateDefaultServiceAccount"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "cloudfunctions_allowedIngressSettings" {
  name   = "${local.org_policy_name_prefix}/cloudfunctions.allowedIngressSettings"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "ALLOW_INTERNAL_AND_GCLB",
          "ALLOW_INTERNAL_ONLY"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "cloudfunctions_allowedVpcConnectorEgressSettings" {
  name   = "${local.org_policy_name_prefix}/cloudfunctions.allowedVpcConnectorEgressSettings"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "ALL_TRAFFIC",
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "cloudfunctions_requireVPCConnector" {
  name   = "${local.org_policy_name_prefix}/cloudfunctions.requireVPCConnector"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableGlobalSelfManagedSslCertificate" {
  name   = "${local.org_policy_name_prefix}/compute.disableGlobalSelfManagedSslCertificate"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "commerceorggovernance_disablePublicMarketplace" {
  name   = "${local.org_policy_name_prefix}/commerceorggovernance.disablePublicMarketplace"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableAllIpv6" {
  name   = "${local.org_policy_name_prefix}/compute.disableAllIpv6"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableGuestAttributesAccess" {
  name   = "${local.org_policy_name_prefix}/compute.disableGuestAttributesAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableNonFIPSMachineTypes" {
  name   = "${local.org_policy_name_prefix}/compute.disableNonFIPSMachineTypes"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_disableSerialPortAccess" {
  name   = "${local.org_policy_name_prefix}/compute.disableSerialPortAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireOsLogin" {
  name   = "${local.org_policy_name_prefix}/compute.requireOsLogin"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireShieldedVm" {
  name   = "${local.org_policy_name_prefix}/compute.requireShieldedVm"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_requireVpcFlowLogs" {
  name   = "${local.org_policy_name_prefix}/compute.requireVpcFlowLogs"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "LIGHT",
          "COMPREHENSIVE"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "compute_restrictNonConfidentialComputing" {
  name   = "${local.org_policy_name_prefix}/compute.restrictNonConfidentialComputing"
  parent = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_restrictSharedVpcHostProjects" {
  name   = "${local.org_policy_name_prefix}/compute.restrictSharedVpcHostProjects"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "under:${var.folder_networking_id}",
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "compute_restrictXpnProjectLienRemoval" {
  name   = "${local.org_policy_name_prefix}/compute.restrictXpnProjectLienRemoval"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_skipDefaultNetworkCreation" {
  name   = "${local.org_policy_name_prefix}/compute.skipDefaultNetworkCreation"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_vmCanIpForward" {
  name   = "${local.org_policy_name_prefix}/compute.vmCanIpForward"
  parent = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "compute_vmExternalIpAccess" {
  name   = "${local.org_policy_name_prefix}/compute.vmExternalIpAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      deny_all = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "gcp_detailedAuditLoggingMode" {
  name   = "${local.org_policy_name_prefix}/gcp.detailedAuditLoggingMode"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "gcp_resourceLocations" {
  name   = "${local.org_policy_name_prefix}/gcp.resourceLocations"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "in:canada-locations",
          "in:us-locations"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "gcp_restrictTLSVersion" {
  name   = "${local.org_policy_name_prefix}/gcp.restrictTLSVersion"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        denied_values = [
          "TLS_VERSION_1",
          "TLS_VERSION_1_1"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "iam_allowedPolicyMemberDomains" {
  name   = "${local.org_policy_name_prefix}/iam.allowedPolicyMemberDomains"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [data.google_organization.org.directory_customer_id]
      }
    }

    rules {
      allow_all = "TRUE"

      condition {
        title       = "Allow ${var.all_users_ingress_tag_key_short_name} tag"
        description = "See https://cloud.google.com/blog/topics/developers-practitioners/how-create-public-cloud-run-services-when-domain-restricted-sharing-enforced"
        expression  = "resource.matchTagId('${var.all_users_ingress_tag_key_id}', '${var.all_users_ingress_tag_value_id}')"
      }
    }
  }
}

resource "google_org_policy_policy" "iam_automaticIamGrantsForDefaultServiceAccounts" {
  name   = "${local.org_policy_name_prefix}/iam.automaticIamGrantsForDefaultServiceAccounts"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableAuditLoggingExemption" {
  name   = "${local.org_policy_name_prefix}/iam.disableAuditLoggingExemption"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableServiceAccountKeyCreation" {
  name   = "${local.org_policy_name_prefix}/iam.disableServiceAccountKeyCreation"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "iam_disableServiceAccountKeyUpload" {
  name   = "${local.org_policy_name_prefix}/iam.disableServiceAccountKeyUpload"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "pubsub_enforceInTransitRegions" {
  name   = "${local.org_policy_name_prefix}/pubsub.enforceInTransitRegions"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "run_allowedIngress" {
  name   = "${local.org_policy_name_prefix}/run.allowedIngress"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "internal",
          "internal-and-cloud-load-balancing"
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "run_allowedVPCEgress" {
  name   = "${local.org_policy_name_prefix}/run.allowedVPCEgress"
  parent = local.org_policy_parent

  spec {
    rules {
      values {
        allowed_values = [
          "all-traffic",
        ]
      }
    }
  }
}

resource "google_org_policy_policy" "sql_restrictPublicIp" {
  name   = "${local.org_policy_name_prefix}/sql.restrictPublicIp"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_publicAccessPrevention" {
  name   = "${local.org_policy_name_prefix}/storage.publicAccessPrevention"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_secureHttpTransport" {
  name   = "${local.org_policy_name_prefix}/storage.secureHttpTransport"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}

resource "google_org_policy_policy" "storage_uniformBucketLevelAccess" {
  name   = "${local.org_policy_name_prefix}/storage.uniformBucketLevelAccess"
  parent = local.org_policy_parent

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}