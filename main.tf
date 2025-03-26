terraform {
  required_version = "~> 1.10"

  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "~> 3.8"
    }
  }
}

locals {
  disk_map = {
    for disk in var.internal_disks :
    format("%02d-%02d", disk.bus_number, disk.unit_number) => disk
  }

  sorted_keys = sort(keys(local.disk_map))

  sorted_disks = [
    for k in local.sorted_keys : local.disk_map[k]
  ]

  selected_disk = local.sorted_disks[var.disk_index]
}

resource "vcd_vm_internal_disk" "int_disk" {
  count = length(var.internal_disks)

  org             = var.vdc_org_name
  vdc             = var.vdc_name
  vapp_name       = var.vapp_name
  vm_name         = var.vm_name
  size_in_mb      = var.internal_disks[count.index].size_in_mb
  bus_type        = var.internal_disks[count.index].bus_type
  bus_number      = var.internal_disks[count.index].bus_number
  unit_number     = var.internal_disks[count.index].unit_number
  iops            = var.internal_disks[count.index].iops
  storage_profile = var.internal_disks[count.index].storage_profile
  allow_vm_reboot = var.vm_internal_disk_allow_vm_reboot
}
