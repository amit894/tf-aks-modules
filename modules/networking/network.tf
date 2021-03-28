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

resource "azurerm_public_ip" "gw_ip" {
  count = var.enable_gateway ? 1 : 0
  name                         = "${var.prefix}-gw-fe-ip"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  allocation_method            = "Static"
  sku                          = "Standard"

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

resource "azurerm_application_gateway" "network" {
  count = var.enable_gateway ? 1 : 0
  name                = "${var.prefix}-gateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = azurerm_subnet.gateway[0].id
  }


  frontend_port {
    name = "httpsPort"
    port = 443
  }

  frontend_port {
      name = "${var.prefix}-ftpe"
      port = 80
    }

  frontend_ip_configuration {
    name                 = "${var.prefix}-ftpe-config"
    public_ip_address_id = azurerm_public_ip.gw_ip[0].id
  }

  backend_address_pool {
    name = "${var.prefix}-be-addr"
  }

  backend_http_settings {
    name                  = "${var.prefix}-be-http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "${var.prefix}-http-list"
    frontend_ip_configuration_name = "${var.prefix}-ftpe-config"
    frontend_port_name             = "${var.prefix}-ftpe"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${var.prefix}-rout-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.prefix}-http-list"
    backend_address_pool_name  = "${var.prefix}-be-addr"
    backend_http_settings_name = "${var.prefix}-be-http-setting"
  }

  tags = var.tags

  depends_on = [
    azurerm_virtual_network.aks_vnet,
    azurerm_public_ip.gw_ip,
    azurerm_subnet.gateway
  ]
}
