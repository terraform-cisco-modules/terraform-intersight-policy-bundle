

resource "intersight_fabric_eth_network_group_policy" "fabric_eth_network_group_policy1" {
  name        = "${var.policy_prefix}-eth-network-group"
  description = var.description
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


# =============================================================================
# LAN Connectivity
# -----------------------------------------------------------------------------

resource "intersight_vnic_lan_connectivity_policy" "vnic_lan1" {
  name                = "${var.policy_prefix}-lan-connectivity"
  description         = var.description
  iqn_allocation_type = "None"
  placement_mode      = "auto"
  target_platform     = "FIAttached"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  # add policy to the specified server profile template
  profiles {
    moid        = intersight_server_profile_template.template1.moid
    object_type = "server.ProfileTemplate"
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
# vNICs
# -----------------------------------------------------------------------------
resource "intersight_vnic_eth_if" "eth0" {
  name             = "eth0"
  order            = 0
  failover_enabled = false
  mac_address_type = "POOL"
  mac_pool {
    moid = var.vnic_mac_pool
  }
  placement {
    id        = ""
    pci_link  = 0
    switch_id = "A"
    uplink    = 0
  }
  cdn {
    value     = "eth0"
    nr_source = "vnic"
  }
  usnic_settings {
    cos      = 5
    nr_count = 0
  }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.vnic_lan1.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.v_eth_adapter1.id
  }
  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.v_eth_qos1.id
  }
  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.fabric_eth_network_group_policy1.moid
  }
  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.fabric_eth_network_control_policy1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
resource "intersight_vnic_eth_if" "eth1" {
  name             = "eth1"
  order            = 0
  failover_enabled = false
  mac_address_type = "POOL"
  mac_pool {
    moid = var.vnic_mac_pool
  }
  placement {
    id        = ""
    pci_link  = 0
    switch_id = "B"
    uplink    = 0
  }
  cdn {
    value     = "eth1"
    nr_source = "vnic"
  }
  usnic_settings {
    cos      = 5
    nr_count = 0
  }
  vmq_settings {
    enabled             = false
    multi_queue_support = false
    num_interrupts      = 16
    num_vmqs            = 4
  }
  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.vnic_lan1.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.v_eth_adapter1.id
  }
  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.v_eth_qos1.id
  }
  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.fabric_eth_network_group_policy1.moid
  }
  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.fabric_eth_network_control_policy1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
