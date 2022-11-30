@description('The name of the Workspace.')
param workspaceName string

@description('The name of the primary ADLS Gen2 Storage Account. If not provided, the workspace name will be used.')
param storageAccountName string

@description('Provide the user name for SQL login.')
param sqlAdministratorLogin string

@description('The passwords must meet the following guidelines:<ul><li> The password does not contain the account name of the user.</li><li> The password is at least eight characters long.</li><li> The password contains characters from three of the following four categories:</li><ul><li>Latin uppercase letters (A through Z)</li><li>Latin lowercase letters (a through z)</li><li>Base 10 digits (0 through 9)</li><li>Non-alphanumeric characters such as: exclamation point (!), dollar sign ($), number sign (#), or percent (%).</li></ul></ul> Passwords can be up to 128 characters long. Use passwords that are as long and complex as possible. Visit <a href=https://aka.ms/azuresqlserverpasswordpolicy>aka.ms/azuresqlserverpasswordpolicy</a> for more details.')
@secure()
param sqlAdministratorPassword string
param tagValues object = {
  'Created with': 'Synapse Azure Resource Manager deploment template'
}

@description('The uri to a key in your Key Vault to add a second layer of encryption on top of the default infrastructure encryption')
param cmkUri string = ''

var dataLakeStorageName = (empty(storageAccountName) ? replace(toLower(workspaceName), '-', '') : toLower(storageAccountName))
var cmkUriStripVersion = (empty(cmkUri) ? '' : substring(cmkUri, 0, lastIndexOf(cmkUri, '/')))
var withCmk = {
  cmk: {
    key: {
      name: 'default'
      keyVaultUrl: cmkUriStripVersion
    }
  }
}
var encryption = (empty(cmkUri) ? json('{}') : withCmk)

module storage '?' /*TODO: replace with correct path to [uri(deployment().properties.templateLink.uri, '/Azure-Samples/Synapse/master/Manage/DeployWorkspace/storage/azuredeploy.json')]*/ = {
  name: 'storage'
  params: {
    storageAccount: dataLakeStorageName
    workspaceContainer: toLower(workspaceName)
  }
}

module workspace '?' /*TODO: replace with correct path to [uri(deployment().properties.templateLink.uri, '/Azure-Samples/Synapse/master/Manage/DeployWorkspace/workspace/azuredeploy.json')]*/ = {
  name: 'workspace'
  params: {
    name: toLower(workspaceName)
    sqlAdministratorLogin: sqlAdministratorLogin
    sqlAdministratorPassword: sqlAdministratorPassword
    defaultDataLakeStorageAccountName: dataLakeStorageName
    defaultDataLakeStorageFilesystemName: toLower(workspaceName)
    tagValues: tagValues
    encryption: encryption
  }
  dependsOn: [
    storage
  ]
}