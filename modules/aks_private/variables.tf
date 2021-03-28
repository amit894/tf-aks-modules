variable "prefix" {
  description = "Prefix to be used for resources to will be created"
  default = "test-app"
}

variable "region" {
  description = "Region name where rg will be hosted"
  default = "eastus"
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

variable "default_node_pool_cluster_auto_scaling_min_count" {
  description = "User Pool Node Count"
  default = 1
}

variable "default_node_pool_cluster_auto_scaling_max_count" {
  description = "User Pool Node Count"
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

variable "user_node_pool_cluster_auto_scaling_min_count" {
  description = "User Pool Node Count"
  default = 1
}

variable "user_node_pool_cluster_auto_scaling_max_count" {
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

variable "enable_role_based_access_control"{
  description = "Adding a role to manage AKS Cluster"
  default = "true"
}

variable "log_analytics_workspace_id"{
  description = "Log Analytics Workspace ID"
}

variable "ssh_key"{
  description = "SSH Key to Login to the Nodes"
}

variable "admin_user"{
  description = "Admin User for the Nodes"
}

variable "aad_admin_group_object_ids"{
  description = "Admin User for the Nodes"
}
