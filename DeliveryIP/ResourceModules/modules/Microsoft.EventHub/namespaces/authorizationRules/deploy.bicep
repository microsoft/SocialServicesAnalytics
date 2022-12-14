@description('Required. The name of the event hub namespace')
param namespaceName string

@description('Required. The name of the authorization rule')
param name string

@description('Optional. The rights associated with the rule.')
@allowed([
  'Listen'
  'Manage'
  'Send'
])
param rights array = []

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

module pid_cuaId '.bicep/nested_cuaId.bicep' = if (!empty(cuaId)) {
  name: 'pid-${cuaId}'
  params: {}
}

resource namespace 'Microsoft.EventHub/namespaces@2021-06-01-preview' existing = {
  name: namespaceName
}

resource authorizationRule 'Microsoft.EventHub/namespaces/AuthorizationRules@2017-04-01' = {
  name: name
  parent: namespace
  properties: {
    rights: rights
  }
}

@description('The name of the authorization rule.')
output authorizationRuleName string = authorizationRule.name

@description('The resource ID of the authorization rule.')
output authorizationRuleResourceId string = authorizationRule.id

@description('The name of the resource group the authorization rule was created in.')
output authorizationRuleResourceGroup string = resourceGroup().name
