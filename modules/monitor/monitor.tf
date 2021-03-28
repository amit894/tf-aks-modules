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
  name     = "${var.prefix}-monitor-rg"
  location = var.region
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "oms" {
  name                     = "${var.prefix}-oms"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "PerGB2018"
  retention_in_days        = 30
}
