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
  name     = "${var.prefix}-acr-rg"
  location = "${var.region}"
  tags     = "${var.tags}"
}

resource "azurerm_container_registry" "acr" {
  name                     = "${var.prefix}-acr"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Premium"
  admin_enabled            = true
  public_network_access_enabled = false
}
