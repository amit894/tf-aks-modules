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
  name     = "${var.prefix}-network-rg"
  location = "${var.region}"
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = "${var.vnet_cidr}"
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "internal_subnet" {
  name                 = "${var.prefix}-internal-subnet"
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = "${var.internal_subnet_cidr}"
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies = true
}
