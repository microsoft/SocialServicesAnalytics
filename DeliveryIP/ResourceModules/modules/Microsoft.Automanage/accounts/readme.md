# Automanage Accounts `[Microsoft.Automanage/accounts]`

This module deploys an Automanage account and associates VM with it.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/roleAssignments` | 2020-04-01-preview |
| `Microsoft.Automanage/accounts` | 2020-06-30-preview |
| `Microsoft.Compute/virtualMachines/providers/configurationProfileAssignments` | 2020-06-30-preview |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `autoManageAccountResourceGroupName` | string | `[format('{0}_group', replace(subscription().displayName, ' ', ''))]` |  | Optional. The resource group name where automanage will be created |
| `configurationProfile` | string | `Production` | `[Production, Dev/Test]` | Optional. The configuration profile of automanage |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered. |
| `location` | string | `[deployment().location]` |  | Optional. The location of automanage |
| `name` | string | `[format('{0}-AutoManage', replace(subscription().displayName, ' ', ''))]` |  | Optional. The name of automanage account |
| `vmName` | string |  |  | Required. The name of the VM to be associated |
| `vmResourceGroupName` | string |  |  | Required. The name of the VM resource group |

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `autoManageAccountName` | string | The name of the auto manage account |
| `autoManageAccountResourceGroup` | string | The resource group the auto manage account was deployed into |
| `autoManageAccountResourceId` | string | The resource ID of the auto manage account |

## Template references

- [Define resources with Bicep and ARM templates](https://docs.microsoft.com/en-us/azure/templates)
