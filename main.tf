
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.54.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.primary_subscription_id
}


data "azurerm_client_config" "core" {}

# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "demo"
}

variable "root_name" {
  type    = string
  default = "eslz"
}

variable "default_location" {
  type    = string
  default = "eastus"
}

variable "primary_subscription_id" {
  type    = string
}
  

# Declare the Azure landing zones Terraform module
module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"

  default_location = var.default_location
  library_path   = "${path.root}/lib"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_management_resources = false
  deploy_connectivity_resources  = false

}
