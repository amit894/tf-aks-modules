variable "vnet_subnet_id" {
  description = "CIDR of the AKS Subnet for hosting"
}

variable "principal_id" {
  description = "AKS Cluster identity's Principal ID"
}

variable "container_registry_id" {
  description = "Container Registry ID"
}

variable "kubelet_object_id" {
  description = "Object Id for the Kubelet for the AKS Cluster"
}

variable "network_resource_group_id" {
  description = "Scope for Network Resource Group"
}

variable "cluster_resource_group_id" {
  description = "Scope for Cluster Resource Group"
}

variable "network_admin.object_id {
  description = "Identities for Network Admin Role"
}

variable "cluster_admin.object_id" {
  description = "Identities for Cluster Admin Role"
}
