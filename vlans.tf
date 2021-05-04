# =============================================================================
# VLAN Policy
# -----------------------------------------------------------------------------
resource "intersight_fabric_eth_network_policy" "fabric_eth_network_policy1" {
  name        = "${var.policy_prefix}-vlan-policy"
  description = var.description
  organization {
    moid = var.organization
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
  auto_allow_on_uplinks = true
  is_native             = false
  name                  = "vlan1010"
  vlan_id               = 1010
  multicast_policy {
    moid = intersight_fabric_multicast_policy.fabric_multicast_policy1.moid
  }
  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.fabric_eth_network_policy1.id
  }
}

