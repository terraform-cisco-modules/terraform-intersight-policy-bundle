

resource "intersight_fabric_eth_network_group_policy" "fabric_eth_network_group_policy1" {
  name        = "${var.policy_prefix}-eth-network-group"
  description = var.description
  # target_platform = "FIAttached"
  vlan_settings {
    native_vlan   = 1
    allowed_vlans = join(",", values(var.uplink_vlans_6454))
  }
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

resource "intersight_fabric_eth_network_control_policy" "fabric_eth_network_control_policy1" {
  name        = "${var.policy_prefix}-eth-network-control"
  description = var.description
  cdp_enabled = true
  forge_mac   = "allow"
  lldp_settings {
    object_type      = "fabric.LldpSettings"
    receive_enabled  = false
    transmit_enabled = false
  }
  mac_registration_mode = "allVlans"
  uplink_fail_action    = "linkDown"
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

resource "intersight_vnic_eth_qos_policy" "v_eth_qos1" {
  name           = "${var.policy_prefix}-vnic-eth-qos"
  description    = var.description
  mtu            = 1500
  rate_limit     = 0
  cos            = 0
  burst          = 1024
  priority       = "Best Effort"
  trust_host_cos = false
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

# this policy is actually quite complex but we are taking all the defaults
resource "intersight_vnic_eth_adapter_policy" "v_eth_adapter1" {
  name        = "${var.policy_prefix}-vnic-eth-adapter"
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
