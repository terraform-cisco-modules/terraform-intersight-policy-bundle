# =============================================================================
# Switch cluster
# -----------------------------------------------------------------------------

resource "intersight_fabric_switch_cluster_profile" "fabric_switch_cluster_profile1" {
  name        = "${var.policy_prefix}-domain"
  description = var.description
  type        = "instance"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

# =============================================================================
# Switches (A and B)
# -----------------------------------------------------------------------------

resource "intersight_fabric_switch_profile" "fabric_switch_profile_a" {
  action      = "No-op"
  description = var.description
  name        = "${var.policy_prefix}-domain-profile-A"
  type        = "instance"
  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.fabric_switch_cluster_profile1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
resource "intersight_fabric_switch_profile" "fabric_switch_profile_b" {
  action      = "No-op"
  description = var.description
  name        = "${var.policy_prefix}-domain-profile-B"
  type        = "instance"
  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.fabric_switch_cluster_profile1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

# =============================================================================
# Server Profile template
# -----------------------------------------------------------------------------

resource "intersight_server_profile_template" "template1" {
  description     = var.description
  name            = "${var.policy_prefix}-template"
  target_platform = "FIAttached"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
