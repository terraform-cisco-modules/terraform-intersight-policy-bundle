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
    name        = "NFSDVD"
    object_type = "boot.VirtualMedia"
  }
  boot_devices {
    enabled     = true
    name        = "LocalDisk"
    object_type = "boot.LocalDisk"
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


# =============================================================================
# Device Connector Policy
# -----------------------------------------------------------------------------

resource "intersight_deviceconnector_policy" "dc1" {
  description     = var.description
  lockout_enabled = true
  name            = "${var.policy_prefix}-device-connector"
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
# NTP Policy
# -----------------------------------------------------------------------------

resource "intersight_ntp_policy" "ntp1" {
  description = var.description
  enabled     = true
  name        = "${var.policy_prefix}-ntp"
  ntp_servers = [
    "172.16.1.90",
    "172.16.1.91"
  ]
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
  timezone = "America/Chicago"
}


# =============================================================================
# IPMI over LAN
# -----------------------------------------------------------------------------

resource "intersight_ipmioverlan_policy" "ipmi2" {
  description = var.description
  enabled     = false
  name        = "${var.policy_prefix}-ipmi-disabled"
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
# Network Connectivity (DNS)
# -----------------------------------------------------------------------------

# IPv6 is enabled because this is the only way that the provider allows the
# IPv6 DNS servers (primary and alternate) to be set to something. If it is not
# set to something other than null in this resource, then terraform "apply"
# will detect that thare changes to apply every time ("::" -> null).

resource "intersight_networkconfig_policy" "connectivity1" {
  alternate_ipv4dns_server = "172.16.1.90"
  preferred_ipv4dns_server = "172.16.1.98"
  description              = var.description
  enable_dynamic_dns       = false
  enable_ipv4dns_from_dhcp = false
  enable_ipv6              = false
  enable_ipv6dns_from_dhcp = false
  name                     = "${var.policy_prefix}-dns"
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
# KVM Policy
# -----------------------------------------------------------------------------

resource "intersight_kvm_policy" "kvmpolicy1" {
  description               = var.description
  enable_local_server_video = true
  enable_video_encryption   = true
  enabled                   = true
  maximum_sessions          = 4
  name                      = "${var.policy_prefix}-kvm"
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
  description   = var.description
  enabled       = true
  encryption    = false
  low_power_usb = true
  name          = "${var.policy_prefix}-vmedia-ubuntu"
  mappings = [{
    additional_properties   = ""
    authentication_protocol = "none"
    class_id                = "vmedia.Mapping"
    device_type             = "cdd"
    file_location           = "infra-chx.auslab.cisco.com/software/linux/ubuntu-18.04.5-server-amd64.iso"
    host_name               = "infra-chx.auslab.cisco.com"
    is_password_set         = false
    mount_options           = "RO"
    mount_protocol          = "nfs"
    object_type             = "vmedia.Mapping"
    password                = ""
    remote_file             = "ubuntu-18.04.5-server-amd64.iso"
    remote_path             = "/iso/software/linux"
    sanitized_file_location = "infra-chx.auslab.cisco.com/software/linux/ubuntu-18.04.5-server-amd64.iso"
    username                = ""
    volume_name             = "NFSDVD"
  }]
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
