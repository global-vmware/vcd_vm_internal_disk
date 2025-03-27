output "disk_id" {
  value = vcd_vm_internal_disk.int_disk.id
}

output "internal_disks" {
  description = "Details of internal disk added to the VM"
  value = {
    vm_name         = vcd_vm_internal_disk.int_disk.vm_name
    size_in_mb      = vcd_vm_internal_disk.int_disk.size_in_mb
    bus_number      = vcd_vm_internal_disk.int_disk.bus_number
    unit_number     = vcd_vm_internal_disk.int_disk.unit_number
    bus_type        = vcd_vm_internal_disk.int_disk.bus_type
    iops            = vcd_vm_internal_disk.int_disk.iops
    storage_profile = vcd_vm_internal_disk.int_disk.storage_profile
  }
}