output "disk_id" {
  value = vcd_vm_internal_disk.int_disk[0].id
}

output "internal_disks" {
  description = "Details of internal disks added to the VM"
  value       = { for idx, disk in vcd_vm_internal_disk.int_disk : idx => {
    vm_name         = disk.vm_name
    size_in_mb      = disk.size_in_mb
    bus_number      = disk.bus_number
    unit_number     = disk.unit_number
    bus_type        = disk.bus_type
    iops            = disk.iops
    storage_profile = disk.storage_profile
  } }
}

