resource "azapi_resource" "aca" {
  type      = "Microsoft.App/managedEnvironments@2022-03-01"
  name      = var.container_apps_name
  parent_id = azurerm_resource_group.rg.id
  location  = azurerm_resource_group.rg.location

  body = jsonencode({
    properties = {
      appLogsConfiguration = {
        destination = "log-analytics"
        logAnalyticsConfiguration = {
          customerId = azurerm_log_analytics_workspace.log.workspace_id
          sharedKey  = azurerm_log_analytics_workspace.log.primary_shared_key
        }
      }
    }
  })
}

resource "azapi_resource" "hello" {
  type      = "Microsoft.App/containerApps@2022-03-01"
  name      = "hello-service"
  parent_id = azurerm_resource_group.rg.id
  location  = azurerm_resource_group.rg.location

  body = jsonencode({
    properties = {
      configuration = {
          activeRevisionsMode = "Single"
          ingress = {
              external = true
              targetPort = 80
            }
      }
      template = {
        containers = [
          {
            name  = "simple-hello-world-container"
            image = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
          }
        ]
        revisionSuffix = "1"
        scale = {
          minReplicas = 1
          maxReplicas = 1
        }
      }
      managedEnvironmentId = azapi_resource.aca.id
    }
  })
}