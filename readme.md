# Module - ACR RBAC Dedicated
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the permissions on ACR dedicated for an application.

The following permissions will be granted on Azure RBAC:

- AcrPull
- AcrPush
- AcrDelete
- Reader on resource group where the ACR is located <optional>

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0       | v1.3.6 | 3.37.0         |

## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

## Exemplo de uso

```hcl
module "rbac_groups_acr" {
  source = "git::https://https://github.com/danilomnds/terraform-azurerm-acr-rbac-dedicated?ref=v1.0.0"
  scope = <acr id>
  role_assignment = {
    <group name> = {
      # this command help you to get the object id az ad group show --group <group name> --query objectId --out tsv
      principal_id = <group id on Azure AD>
    }
    <group name> = {
      principal_id = <group id on Azure AD>
    }
  }
}
```
## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| scope | ACR id | `string` | n/a | `Yes` |
| role_assignment | possible values for each assignment on Azure (full list of parameters below) | `string` | n/a | `Yes` |
| reader_permission_on_rg | enable or disable the reader permission on rg scope | `bool` | `false` | No |
| reader_permission_on_acr | enable or disable the reader permission on acr scope | `bool` | `false` | No |

## List of parameters that can be defined in each assignment

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | A unique UUID/GUID for this role assignment - one will be generated if not specified | `string` | n/a | No |
| principal_id | The ID of the principal (user, group or service principal) to assign the role definition to | `string` | n/a | `Yes` |
| condition | The condition that limits the resources that the role can be assigned to | `string` | n/a | No |
| condition_version | The version of the condition. Possible values are 1.0 or 2.0 | `string` | n/a | No |
| delegated_managed_identity_resource_id | The delegated Azure Resource Id which contains a Managed Identity | `string` | n/a | No |
| description | The description for this role assignment | `string` | n/a | No |
| skip_service_principal_aad_check | skip the Azure AD account verification | `bool` | `false` | No |

## Documentation
Terraform Role Assignment: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)<br>