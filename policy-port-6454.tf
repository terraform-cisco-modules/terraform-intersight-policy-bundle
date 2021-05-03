# the port policy is the parent for port mode and role
resource "intersight_fabric_port_policy" "fabric_port_policy1" {
  name         = "${var.policy_prefix}-6454-portpolicy"
  description  = var.description
  device_model = "UCS-FI-6454"
  organization {
    object_type = "organization.Organization"
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

# set the first four ports to be FC
resource "intersight_fabric_port_mode" "fabric_port_mode1" {
  custom_mode   = "FibreChannel"
  port_id_end   = 4
  port_id_start = 1
  slot_id       = 1
  port_policy {
    moid = intersight_fabric_port_policy.fabric_port_policy1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

# configure server ports
resource "intersight_fabric_server_role" "fabric_server_role1" {
  aggregate_port_id = 0
  port_id           = 47
  slot_id           = 1
  port_policy {
    moid = intersight_fabric_port_policy.fabric_port_policy1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

# configure uplink port channel
resource "intersight_fabric_uplink_pc_role" "fabric_uplink_pc_role1" {
  pc_id = 100
  ports {
    port_id           = 49
    aggregate_port_id = 0
    slot_id           = 1
  }
  ports {
    port_id           = 50
    aggregate_port_id = 0
    slot_id           = 1
  }
  admin_speed = "Auto"
  port_policy {
    moid = intersight_fabric_port_policy.fabric_port_policy1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}