terraform {
  required_version = "~> 1.5"

  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "~> 3.9"
    }
  }
}

# Retrieve the vApp name based on the provided VM name
data "vcd_vm" "vm" {
  org             = var.vdc_org_name
  vdc             = var.vdc_name
  name            = var.vm_name
}

resource "vcd_vm_internal_disk" "int_disk" {
  count = length(var.internal_disks)

  org             = var.vdc_org_name
  vdc             = var.vdc_name
  vapp_name       = data.vcd_vm.vm.vapp_name
  vm_name         = var.vm_name
  size_in_mb      = var.internal_disks[count.index].size_in_mb
  bus_type        = var.internal_disks[count.index].bus_type
  bus_number      = var.internal_disks[count.index].bus_number
  unit_number     = var.internal_disks[count.index].unit_number
}


