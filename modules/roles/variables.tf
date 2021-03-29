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
