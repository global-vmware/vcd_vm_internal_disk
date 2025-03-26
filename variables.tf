variable "vdc_org_name" {
  type        = string
  description = "Cloud Director Organization Name"
  default     = ""
}

variable "vdc_name" {
  type        = string
  description = "Cloud Director VDC Name"
  default     = ""
}

variable "vapp_name" {
  description = "The name of the vApp that contains the VM."
  type        = string
}

variable "vm_name" {
  description = "The name of the VM to which internal disks are added."
  type        = string
}

variable "internal_disks" {
  description = "List of internal disk configurations."
  type = list(object({
    size_in_mb      = number
    bus_type        = string
    bus_number      = number
    unit_number     = number
    iops            = number
    storage_profile = optional(string)
  }))
}

variable "disk_index" {
  description = "Which disk to apply from the sorted list"
  type        = number
  default     = 0
}

variable "vm_internal_disk_allow_vm_reboot" {
  description = "Ensures disks can be added to powered-on VMs"
  default     = true
}