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
  tags     = "${var.tags}"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}-k8s"
  private_cluster_enabled = true


  default_node_pool {
    name           = "system"
    node_count     = "${var.default_node_pool_node_count}"
    vm_size        = "${var.default_node_pool_vm_size}"
    vnet_subnet_id = "${var.internal_subnet_id}"
    enable_auto_scaling   = true
    min_count             = "${var.default_node_pool_cluster_auto_scaling_min_count}"
    max_count             = "${var.default_node_pool_cluster_auto_scaling_max_count}"
    enable_node_public_ip = false
  }

  identity {
    type = "SystemAssigned"
  }


  network_profile {
   load_balancer_sku = "${var.load_balancer_sku}"
   network_plugin = "${var.network_plugin}"
   service_cidr = "${var.service_cidr}"
   docker_bridge_cidr = "${var.docker_bridge_cidr}"
   dns_service_ip = "${var.dns_service_ip}"
   }

   linux_profile {
    admin_username = var.admin_user

    ssh_key {
      key_data = replace(var.ssh_key, "\n", "")
    }
  }

  role_based_access_control {
    enabled = var.enable_role_based_access_control
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
      enabled = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "${var.user_node_pool_vm_size}"
  node_count            = "${var.user_node_pool_node_count}"
  vnet_subnet_id        = "${var.internal_subnet_id}"
  enable_auto_scaling   = true
  min_count             = "${var.user_node_pool_cluster_auto_scaling_min_count}"
  max_count             = "${var.user_node_pool_cluster_auto_scaling_max_count}"
  enable_node_public_ip = false
}
