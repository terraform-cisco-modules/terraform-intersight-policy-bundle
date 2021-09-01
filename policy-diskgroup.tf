# =============================================================================
# Policy - Disk Group Policy
# -----------------------------------------------------------------------------

# create a RAID mirror between the first two physical disks

resource "intersight_storage_drive_group" "group1" {
  description = var.description
  name        = "${var.policy_prefix}-disk-group"
  raid_level  = "Raid1"
  manual_drive_group = [{
    span_groups = [
      {
        slots = "1,2"
      }
    ]
  }]
  virtual_drives = [{
    boot_drive = false
    expand_to_available = true
    name = "vd0"
    size = 0
    virtual_drive_policy = [{
      access_policy = "Default"
      drive_cache = "Default"
      read_policy = "Default"
      strip_size = 64
      write_policy = "Default"
    }]
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
  unused_disks_state           = "UnconfiguredGood"
  drive_group = [{
    moid                  = intersight_storage_disk_group_policy.group1.moid
    class_id              = "mo.MoRef"
    object_type           = "storage.DiskGroupPolicy"
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