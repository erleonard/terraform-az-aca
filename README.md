![CI](https://github.com/erleonard/terraform-az-aca/actions/workflows/blank.yml/badge.svg) ![GitHub](https://img.shields.io/github/license/erleonard/terraform-az-aca) ![Terraform](https://img.shields.io/badge/Terraform-v1.2.2-blue) ![Azurerm](https://img.shields.io/badge/AzureRM-v3.0.0-blue)

# Terraform Deployment of Azure Container Apps

This repository is an example utilizing the new AzAPI terraform provider to deploy Azure Container Apps with a simple 'Hello World' app.

## What is the AzAPI terraform provider?

The AzAPI provider is a very thin layer on top of the Azure ARM REST APIs. Use this new provider to authenticate to - and manage - Azure resources and functionality using the Azure Resource Manager APIs directly. This provider compliments the Azure Resource Manager provider (AzureRM provider) by enabling the management of Azure resources that are not yet or might never be supported in the AzureRM provider, such as private and public preview services and features.

## Prerequisite
If using your workstation, you will need the following installed:
- Azure Account
- Azure CLI
- Terraform CLI

Alternatively you can use the Azure Cloud Shell that have all the prerequisite software installed.

## Usage

```
az ad sp create-for-rbac --name TerraformSP --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
$ export ARM_CLIENT_ID="<APPID_VALUE>"
$ export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
$ export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
$ export ARM_TENANT_ID="<TENANT_VALUE>"
```

- Clone repository from GitHub
```
git clone
```

1. Initialize the project, which downloads all the required providers to deploy our solution.
```
terraform init
```
2. Generate the terrform execution plan
```
terraform plan
```
3. Apply the terraform execution plan
```
terraform apply main
```

## Reference
- [Announcing Azure Terrafy and AzAPI Terraform Provider Previews](https://techcommunity.microsoft.com/t5/azure-tools-blog/announcing-azure-terrafy-and-azapi-terraform-provider-previews/ba-p/3270937)
- [Overview of the Terraform AzAPI provider](https://docs.microsoft.com/en-us/azure/developer/terraform/overview-azapi-provider)
- [Container Apps ARM template API specification](https://docs.microsoft.com/en-us/azure/container-apps/azure-resource-manager-api-spec?tabs=arm-template)