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
  location = var.region
  tags     = var.tags
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_cidr
}

resource "azurerm_subnet" "aks" {
  name                 = "${var.prefix}-aks-subnet"
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.aks_subnet_cidr
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies = true
}

resource "azurerm_subnet" "gateway" {
  count = var.enable_gateway ? 1 : 0
  name                 = "${var.prefix}-gateway-subnet"
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.gateway_subnet_cidr
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies = true
}
