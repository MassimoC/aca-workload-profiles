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
    replicas: 28
    environmentId: managedEnvironment.id
    location:location
    tags:tags
  }
}

module app02 'modules/app.bicep' = {
  name: take('${deployment().name}-app02', 64)
  scope : resourceGroup(resourceGroupName)
  params: {
    id: '02'
    replicas: 28
    environmentId: managedEnvironment.id
    location:location
    tags:tags
  }
}

module app03 'modules/app.bicep' = {
  name: take('${deployment().name}-app03', 64)
  scope : resourceGroup(resourceGroupName)
  params: {
    id: '03'
    replicas: 28
    environmentId: managedEnvironment.id
    location:location
    tags:tags
  }
}

module appConsumption 'modules/app.bicep' = {
  name: take('${deployment().name}-cons', 64)
  scope : resourceGroup(resourceGroupName)
  params: {
    id: '04'
    replicas: 20
    environmentId: managedEnvironment.id
    targetProfile: 'Consumption'
    location:location
    tags:tags
  }
}
