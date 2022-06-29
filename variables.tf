variable "resource_group_name" {
    description = "Specify the resource group name in which the resources will be deployed to."
    default     = "aca-rg"
    type        = string
}

variable "location_name" {
    description = "Specify the Azure region in which the resources will be deployed to."
    default     = "canadacentral"
    type        = string
}

variable "log_analytics_workspace_name" {
    description = "Specify the name of the Log Analytics Workspace"
    type        = string
}

variable "container_apps_name" {
    description = "Specify the name of the Azure Container Apps"
    type        = string
}