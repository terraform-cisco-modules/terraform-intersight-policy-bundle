# =============================================================================
# Policy - Disk Group Policy
# -----------------------------------------------------------------------------

# create a RAID mirror between the first two physical disks

resource "intersight_storage_disk_group_policy" "group1" {
  description = var.description
  name        = "${var.policy_prefix}-disk-group"
  raid_level  = "Raid1"
  span_groups = [{
    additional_properties = ""
    class_id              = "storage.SpanGroup"
    disks = [{
      additional_properties = ""
      class_id              = "storage.LocalDisk"
      object_type           = "storage.LocalDisk"
      slot_number           = 1
      },
      {
        additional_properties = ""
        class_id              = "storage.LocalDisk"
        object_type           = "storage.LocalDisk"
        slot_number           = 2
      }
    ]
    object_type = "storage.SpanGroup"
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

# policy that uses the RAID mirror to create a virtual disk called vd0

resource "intersight_storage_storage_policy" "storage1" {
  description                  = var.description
  name                         = "${var.policy_prefix}-storage"
  retain_policy_virtual_drives = false
  unused_disks_state           = "UnconfiguredGood"
  disk_group_policies = [{
    additional_properties = ""
    moid                  = intersight_storage_disk_group_policy.group1.moid
    class_id              = "mo.MoRef"
    object_type           = "storage.DiskGroupPolicy"
    selector              = ""
  }]
  virtual_drives = [{
    access_policy         = "Default"
    additional_properties = ""
    boot_drive            = false
    class_id              = "storage.VirtualDriveConfig"
    disk_group_name       = intersight_storage_disk_group_policy.group1.name
    disk_group_policy     = intersight_storage_disk_group_policy.group1.moid
    drive_cache           = "Default"
    expand_to_available   = true
    io_policy             = "Default"
    name                  = "vd0"
    object_type           = "storage.VirtualDriveConfig"
    read_policy           = "Default"
    size                  = 0
    strip_size            = "Default"
    vdid                  = "value"
    write_policy          = "Default"
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
