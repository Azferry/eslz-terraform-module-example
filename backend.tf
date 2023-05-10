terraform {
  backend "azurerm" {
    resource_group_name  = "ntc-mgt-terra-wus3-p-rg01"
    storage_account_name = "ntcmgtterrawus3psa01"
    container_name       = "tfstate-eslzdemo"
    key                  = "eslz-demo.tfstate"
  }
}
