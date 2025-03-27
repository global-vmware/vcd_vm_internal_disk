# VMware Cloud Director Internal Disk Terraform Module

This Terraform module provisions internal disks for a Virtual Machine (VM) in VMware Cloud Director (VCD). It attaches internal disks to an existing VM within a vApp in VCD.

## Requirements

| Name      | Version |
|-----------|---------|
| terraform | ~> 1.5  |
| vcd       | ~> 3.9  |

## Resources

| Name | Type |
|------|------|
| [vcd_vm](https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vm) | data source |
| [vcd_vm_internal_disk](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/vm_internal_disk) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| vdc_org_name | Cloud Director Organization Name | string | `""` | yes |
| vdc_name | Cloud Director VDC Name | string | `""` | yes |
| vm_name | The name of the VM to which internal disks are added. | string | `""` | yes |
| internal_disks | List of internal disk configurations. | list(object({ size_in_mb = number, bus_type = string, bus_number = number, unit_number = number, iops = optional(number), storage_profile = optional(string) })) | `[]` | yes |

## Outputs

| Name | Description |
|------|-------------|
| disk_id | ID of the first internal disk added to the VM. |
| internal_disks | Details of all internal disks added to the VM. |

## Example Usage

Below is an example of how to use this module in a Terraform configuration:

```terraform
module "vcd_vm_internal_disk" {
  source = "github.com/global-vmware/vcd_vm_internal_disk.git?ref=v1.0.1"

  vdc_org_name  = "<US1-VDC-ORG-NAME>"
  vdc_name      = "<US1-VDC-NAME>"

  vm_name       = "Production App Web Server 01"

  internal_disks = [
    {
      size_in_mb      = 10240
      bus_type        = "paravirtual"
      bus_number      = 0
      unit_number     = 1
      iops            = 0
      storage_profile = "Standard"
    }
  ]
}    
```

## Authors

This module is maintained by the VMware Cloud Automation Services Team.
