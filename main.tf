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
  name     = "${var.prefix}-aks-rg"
  location = "${var.region}"
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = "${var.vnet_cidr}"
}

resource "azurerm_subnet" "internal_subnet" {
  name                 = "${var.prefix}-internal-subnet"
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = "${var.internal_subnet_cidr}"
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies = true

}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = "${var.default_node_pool_vm_size}"
    vnet_subnet_id = azurerm_subnet.internal_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  api_server_authorized_ip_ranges = ["201.17.87.61/32"]

  network_profile {
   load_balancer_sku = "Standard"
   network_plugin = "kubenet"
   service_cidr = "192.168.0.0/17"
   docker_bridge_cidr = "192.168.128.1/17"
   dns_service_ip = "192.168.0.10"
   }

   tags = {
       Environment = "Development"
   }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = true
    }

    oms_agent {
      enabled = false
    }
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "${var.user_node_pool_vm_size}"
  node_count            = 1
  vnet_subnet_id        = azurerm_subnet.internal_subnet.id
}
