
resource "intersight_power_policy" "chassis" {
  name                = "${var.policy_prefix}-power-chassis"
  description         = var.description
  dynamic_rebalancing = "Enabled"
  power_save_mode     = "Enabled"
  redundancy_mode     = "N+1"
  organization {
    moid        = var.organization
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

resource "intersight_power_policy" "server" {
  name                = "${var.policy_prefix}-power-server"
  description         = var.description
  power_profiling     = "Enabled"
  power_priority      = "Medium"
  power_restore_state = "AlwaysOff"
  organization {
    moid        = var.organization
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

resource "intersight_thermal_policy" "thermal1" {
  name             = "${var.policy_prefix}-thermal"
  description      = var.description
  fan_control_mode = "Balanced"
  organization {
    moid        = var.organization
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}