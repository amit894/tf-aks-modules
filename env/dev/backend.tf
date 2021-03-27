terraform {
  backend "azurerm" {
    resource_group_name   = "test-app-storage-rg"
    storage_account_name  = "testappaks894"
    key                   = "dev.tfstate"
    container_name        = "tf-states"
  }
}
