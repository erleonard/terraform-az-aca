resource "random_id" "random_suffix" {
  byte_length = 6
}

resource "azurerm_log_analytics_workspace" "log" {
  name                = "${var.log_analytics_workspace_name}-${random_id.random_suffix.dec}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}