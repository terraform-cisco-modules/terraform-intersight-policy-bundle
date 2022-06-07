# =============================================================================
# Boot Precision (boot order) Policy
# -----------------------------------------------------------------------------

resource "intersight_boot_precision_policy" "boot_precision1" {
  name                     = "${var.policy_prefix}-boot-order"
  description              = var.description
  configured_boot_mode     = "Uefi"
  enforce_uefi_secure_boot = false
  boot_devices {
    enabled     = true
    name        = "KVM_DVD"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "kvm-mapped-dvd"
    })
  }
  boot_devices {
    enabled     = true
    name        = "IMC_DVD"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "cimc-mapped-dvd"
    })
  }
  boot_devices {
    enabled     = true
    name        = "LocalDisk"
    object_type = "boot.LocalDisk"
  }
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


# =============================================================================
# Device Connector Policy
# -----------------------------------------------------------------------------

resource "intersight_deviceconnector_policy" "dc1" {
  description     = var.description
  lockout_enabled = true
  name            = "${var.policy_prefix}-device-connector"
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


# =============================================================================
# NTP Policy
# -----------------------------------------------------------------------------

resource "intersight_ntp_policy" "ntp1" {
  description = var.description
  enabled     = true
  name        = "${var.policy_prefix}-ntp"
  timezone    = var.ntp_timezone
  ntp_servers = var.ntp_servers
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


# =============================================================================
# IPMI over LAN
# -----------------------------------------------------------------------------

resource "intersight_ipmioverlan_policy" "ipmi2" {
  description = var.description
  enabled     = false
  name        = "${var.policy_prefix}-ipmi-disabled"
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


# =============================================================================
# Network Connectivity (DNS)
# -----------------------------------------------------------------------------

# IPv6 is enabled because this is the only way that the provider allows the
# IPv6 DNS servers (primary and alternate) to be set to something. If it is not
# set to something other than null in this resource, then terraform "apply"
# will detect that thare changes to apply every time ("::" -> null).

resource "intersight_networkconfig_policy" "connectivity1" {
  alternate_ipv4dns_server = var.dns_alternate
  preferred_ipv4dns_server = var.dns_preferred
  description              = var.description
  enable_dynamic_dns       = false
  enable_ipv4dns_from_dhcp = false
  enable_ipv6              = false
  enable_ipv6dns_from_dhcp = false
  name                     = "${var.policy_prefix}-dns"
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

# =============================================================================
# Multicast
# -----------------------------------------------------------------------------

resource "intersight_fabric_multicast_policy" "fabric_multicast_policy1" {
  name               = "${var.policy_prefix}-multicast"
  description        = var.description
  querier_ip_address = ""
  querier_state      = "Disabled"
  snooping_state     = "Enabled"
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


# =============================================================================
# KVM Policy
# -----------------------------------------------------------------------------

resource "intersight_kvm_policy" "kvmpolicy1" {
  name                      = "${var.policy_prefix}-kvm-enabled"
  description               = var.description
  enable_local_server_video = true
  enable_video_encryption   = true
  enabled                   = true
  maximum_sessions          = 4
  organization {
    moid = var.organization
  }
  remote_port = 2068
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}


# =============================================================================
# Virtual Media Policy
# -----------------------------------------------------------------------------

resource "intersight_vmedia_policy" "vmedia1" {
  name          = "${var.policy_prefix}-vmedia-ubuntu"
  description   = var.description
  enabled       = true
  encryption    = false
  low_power_usb = true
  mappings {
    additional_properties   = ""
    authentication_protocol = "none"
    class_id                = "vmedia.Mapping"
    device_type             = "cdd"
    file_location           = "infra-chx.auslab.cisco.com/software/linux/ubuntu-18.04.5-server-amd64.iso"
    host_name               = "infra-chx.auslab.cisco.com"
    mount_options           = "RO"
    mount_protocol          = "nfs"
    object_type             = "vmedia.Mapping"
    password                = ""
    remote_file             = "ubuntu-18.04.5-server-amd64.iso"
    remote_path             = "/iso/software/linux"
    username                = ""
    volume_name             = "IMC_DVD"
  }
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

resource "intersight_vmedia_policy" "vmedia2" {
  name          = "${var.policy_prefix}-vmedia-enabled"
  description   = var.description
  enabled       = true
  encryption    = false
  low_power_usb = true
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

# =============================================================================
# System Qos Policy
# -----------------------------------------------------------------------------

# this will create the default System QoS policy with zero customization
resource "intersight_fabric_system_qos_policy" "qos1" {
  name        = "${var.policy_prefix}-system-qos"
  description = var.description

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

# =============================================================================
# IMC Access (VLAN and pool)
# -----------------------------------------------------------------------------

resource "intersight_access_policy" "access1" {
  name        = "${var.policy_prefix}-imc-access"
  description = var.description
  inband_vlan = var.imc_access_vlan
  inband_ip_pool {
    object_type = "ippool.Pool"
    moid        = var.imc_access_pool
  }
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

# =============================================================================
# Serial Over LAN
# -----------------------------------------------------------------------------

resource "intersight_sol_policy" "sol1" {
  name        = "${var.policy_prefix}-sol-off"
  description = var.description
  enabled     = false
  baud_rate   = 9600
  com_port    = "com1"
  ssh_port    = 1096
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

resource "intersight_sol_policy" "sol2112" {
  name        = "${var.policy_prefix}-sol-port2112"
  description = var.description
  enabled     = true
  baud_rate   = 9600
  com_port    = "com1"
  ssh_port    = 2112
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

# =============================================================================
# SNMP
# -----------------------------------------------------------------------------

resource "intersight_snmp_policy" "snmp_disabled" {
  name        = "${var.policy_prefix}-snmp-disabled"
  description = var.description
  enabled     = false
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
