# API Management Service Products APIs `[Microsoft.ApiManagement/service/products/apis]`

This module deploys API Management Service Product APIs.

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.ApiManagement/service/products/apis` | 2020-06-01-preview |

## Parameters

| Parameter Name | Type | Default Value | Possible Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `apiManagementServiceName` | string |  |  | Required. The name of the of the API Management service. |
| `cuaId` | string |  |  | Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered |
| `name` | string |  |  | Required. Name of the product API. |
| `productName` | string |  |  | Required. The name of the of the Product. |

## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `apiName` | string | The name of the product API |
| `apiResourceGroup` | string | The resource group the product API was deployed into |
| `apiResourceId` | string | The resource ID of the product API |

## Template references

- [Service/Products/Apis](https://docs.microsoft.com/en-us/azure/templates/Microsoft.ApiManagement/2020-06-01-preview/service/products/apis)
