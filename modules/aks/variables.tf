variable "prefix" {
  description = "Prefix to be used for resources to will be created"
  default = "test-app"
}

variable "region" {
  description = "Region name where rg will be hosted"
  default = "eastus"
}

variable "api_server_authorized_ip_ranges" {
  description = "CIDR block of the Corporate CIDR"
  default = ["201.17.87.61/32"]
}

variable "service_cidr" {
  description = "CIDR block for the Internal AKS Cluster"
  default = "192.168.0.0/17"
}

variable "docker_bridge_cidr" {
  description = "CIDR block of the Docker Brigde between VNET and Internal AKS Cluster"
  default = "192.168.128.1/17"
}

variable "dns_service_ip" {
  description = "CIDR block of the Core DNS component used by AKS Cluster"
  default = "192.168.0.10"
}

variable "default_node_pool_vm_size" {
  description = "Default Node Pool VM Size"
  default = "Standard_D2_v2"
}

variable "default_node_pool_node_count" {
  description = "Default Pool Node Count"
  default = 1
}

variable "user_node_pool_vm_size" {
  description = "User Node Pool VM Size"
  default = "Standard_D2_v2"
}

variable "user_node_pool_node_count" {
  description = "User Pool Node Count"
  default = 1
}

variable "load_balancer_sku" {
  description = "Default Node Pool VM Size"
  default = "Standard"
}

variable "network_plugin" {
  description = "Network Plugin for the K8's cluster"
  default = "kubenet"
}

variable "internal_subnet_id" {
  description = "Subnet id for the AKS Cluster"
  default = ""
}

variable "tags" {
  description = "Tags for the resource"
  default = ""
}
