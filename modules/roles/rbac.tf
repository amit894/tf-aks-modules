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


resource "azurerm_role_assignment" "aks_subnet" {
  scope                = var.vnet_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.principal_id
}

resource "azurerm_role_definition" "network_admin" {
  role_definition_id = "00000000-0000-0000-0000-000000000001"
  name               = "network-admin-role"
  scope              = var.network_resource_group_id

  permissions {
    actions     = ["Microsoft.Network/applicationGateways/read", "Microsoft.Network/applicationGateways/write", "Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/publicIPAddresses/join/action", "Microsoft.Network/publicIPPrefixes/join/action"]
    not_actions = []
  }

  assignable_scopes = [
    var.network_resource_group_id,
  ]
}

resource "azurerm_role_assignment" "network_admin_role_assignment" {
  name               = "00000000-0000-0000-0000-000000000001"
  scope              = var.network_resource_group_id
  role_definition_id = azurerm_role_definition.network_admin.role_definition_resource_id
  principal_id       = var.network_admin.object_id
}


resource "azurerm_role_definition" "cluster_admin" {
  role_definition_id = "00000000-0000-0000-0000-000000000002"
  name               = "cluster-admin-role"
  scope              = var.cluster_resource_group_id

  permissions {
    actions     = ["Microsoft.Compute/diskEncryptionSets/read", "Microsoft.Compute/proximityPlacementGroups/write", "Microsoft.OperationalInsights/workspaces/sharedkeys/read,Microsoft.OperationalInsights/workspaces/read", "Microsoft.OperationsManagement/solutions/write", "Microsoft.OperationsManagement/solutions/read,Microsoft.ManagedIdentity/userAssignedIdentities/assign/action"]
    not_actions = []
  }

  assignable_scopes = [
    var.cluster_resource_group_id,
  ]
}

resource "azurerm_role_assignment" "cluster_admin_role_assignment" {
  name               = "00000000-0000-0000-0000-000000000002"
  scope              = var.cluster_resource_group_id
  role_definition_id = azurerm_role_definition.cluster_admin.role_definition_resource_id
  principal_id       = var.cluster_admin.object_id
}
