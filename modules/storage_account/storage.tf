terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-storage-rg"
  location = "${var.region}"
}


resource "azurerm_storage_account" "str_acc" {
  name                     = "${var.storage_account_name}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "${var.storage_account_tier}"
  account_replication_type = "${var.storage_account_sku}"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "str_cont" {
  name                  = "${var.storage_container_name}"
  storage_account_name  = azurerm_storage_account.str_acc.name
  container_access_type = "private"
}
