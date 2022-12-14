@description('Required. Name of the parent Service Bus Namespace for the Service Bus Queue.')
@minLength(6)
@maxLength(50)
param namespaceName string

@description('Optional. The name of the migration configuration')
param name string = '$default'

@description('Required. Name to access Standard Namespace after migration')
param postMigrationName string

@description('Required. Existing premium Namespace resource ID which has no entities, will be used for migration')
param targetNamespaceResourceId string

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId '.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource namespace 'Microsoft.ServiceBus/namespaces@2021-06-01-preview' existing = {
  name: namespaceName
}

resource migrationConfiguration 'Microsoft.ServiceBus/namespaces/migrationConfigurations@2017-04-01' = {
  name: name
  parent: namespace
  properties: {
    targetNamespace: targetNamespaceResourceId
    postMigrationName: postMigrationName
  }
}

@description('The name of the migration configuration.')
output migrationConfigurationName string = migrationConfiguration.name

@description('The Resource ID of the migration configuration')
output migrationConfigurationResourceId string = migrationConfiguration.id

@description('The name of the Resource Group the migration configuration was created in.')
output migrationConfigurationResourceGroup string = resourceGroup().name
