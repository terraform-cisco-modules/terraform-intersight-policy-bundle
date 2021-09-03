# =============================================================================
# Policy - Disk Group Policy
# -----------------------------------------------------------------------------

# create a RAID mirror between the first two physical disks

resource "intersight_storage_drive_group" "group1" {
  name       = "${var.policy_prefix}-disk-group"
  raid_level = "Raid1"
  manual_drive_group = [{
    additional_properties = ""
    class_id              = "storage.ManualDriveGroup"
    object_type           = "storage.ManualDriveGroup"
    dedicated_hot_spares  = ""
    span_groups = [{
      additional_properties = ""
      class_id              = "storage.SpanDrives"
      object_type           = "storage.SpanDrives"
      slots                 = "1,2"
    }]
  }]
  virtual_drives = [{
    additional_properties = ""
    class_id              = "storage.VirtualDriveConfiguration"
    object_type           = "storage.VirtualDriveConfiguration"
    boot_drive            = false
    expand_to_available   = true
    name                  = "vd0"
    size                  = 0
    virtual_drive_policy = [{
      additional_properties = ""
      class_id              = "storage.VirtualDrivePolicy"
      object_type           = "storage.VirtualDrivePolicy"
      access_policy         = "Default"
      drive_cache           = "Default"
      read_policy           = "Default"
      strip_size            = 64
      write_policy          = "Default"
    }]
  }]
  storage_policy {
    moid = intersight_storage_storage_policy.storage1.moid
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

# # policy that uses the RAID mirror to create a virtual disk called vd0

resource "intersight_storage_storage_policy" "storage1" {
  description        = var.description
  name               = "${var.policy_prefix}-storage"
  unused_disks_state = "UnconfiguredGood"
  use_jbod_for_vd_creation = false
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

resource "intersight_sdcard_policy" "sdcard1" {
  name        = "${var.policy_prefix}-sdcard-os"
  description = var.description
  partitions {
    type        = "OS"
    object_type = "sdcard.Partition"
    virtual_drives {
      enable      = true
      object_type = "sdcard.OperatingSystem"
      additional_properties = jsonencode({
        Name = "Hypervisor"
      })
    }
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