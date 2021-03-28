variable "vnet_subnet_id" {
  description = "CIDR of the AKS Subnet for hosting"
}

variable "cluster_id" {
  description = "AKS Cluster ID"
}

variable "oms_principal_id" {
  description = "AKS OMS Cluster Principal Id"
}

variable "principal_id" {
  description = "CIDR of the VNET for hosting"
}

variable "container_registry_id" {
  description = "Container Registry ID"
}

variable "kubelet_object_id" {
  description = ""
}
