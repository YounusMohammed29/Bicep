param appName string = 'mywebappdemo-2025'
param repoUrl string = 'https://github.com/YounusMohammed29/Bicep.git'
param branch string = 'main'

resource plan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${appName}-plan'
  location: resourceGroup().location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  
}

resource web 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  location: resourceGroup().location
  kind: 'app'
  properties: {
    serverFarmId: plan.id
  }
}

resource sourceControl 'Microsoft.Web/sites/sourcecontrols@2022-03-01' = {
  parent: web
  name: 'web'
  properties: {
    repoUrl: repoUrl
    branch: branch
    isManualIntegration: true
  }
}
