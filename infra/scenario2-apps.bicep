targetScope = 'subscription'

param project string = 'heywprofiles'
param location string = deployment().location
param tags object = {}


// Variables
var projectName = project
var resourceGroupName = 'rg-${projectName}'
var acaEnvironmentName = 'env-${projectName}'


resource managedEnvironment 'Microsoft.App/managedEnvironments@2023-05-01' existing = {
  name : acaEnvironmentName
  scope : resourceGroup(resourceGroupName)
}

module app01 'modules/app.bicep' = {
  name: take('${deployment().name}-app01', 64)
  scope : resourceGroup(resourceGroupName)
  params: {
    id: '01'
    replicas: 5
    environmentId: managedEnvironment.id
    location:location
    tags:tags
  }
}
