terraform {
  backend "azurerm" {
    resource_group_name  = "RG"
    storage_account_name = "SA"
    container_name       = "Container"
    key                  = "eslz-demo.tfstate"
  }
}
