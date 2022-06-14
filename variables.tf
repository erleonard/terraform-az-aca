variable "resource_group_name" {
    description = "Specify the resource group name in which the resources will be deployed to."
    default     = "aca-rg"
    type        = string
}
variable "location" {
    description = "Specify the Azure region in which the resources will be deployed to."
    default     = "canadacentral"
    type        = string
}