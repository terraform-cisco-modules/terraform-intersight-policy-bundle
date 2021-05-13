# =============================================================================
# VLAN Policy
# -----------------------------------------------------------------------------
resource "intersight_fabric_eth_network_policy" "fabric_eth_network_policy1" {
  name        = "${var.policy_prefix}-vlan-policy"
  description = var.description
  organization {
    moid = var.organization
  }
  # assign this policy to the domain profile being created
  profiles {
    moid        = intersight_fabric_switch_profile.fabric_switch_profile_a.moid
    object_type = "fabric.SwitchProfile"
  }
  profiles {
    moid        = intersight_fabric_switch_profile.fabric_switch_profile_b.moid
    object_type = "fabric.SwitchProfile"
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
# VLANs for the above policy
# -----------------------------------------------------------------------------
resource "intersight_fabric_vlan" "fabric_vlan1" {
  for_each = var.uplink_vlans_6454

  auto_allow_on_uplinks = true
  is_native             = false
  name                  = each.key
  vlan_id               = each.value
  multicast_policy {
    moid = intersight_fabric_multicast_policy.fabric_multicast_policy1.moid
  }
  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.fabric_eth_network_policy1.id
  }
}

