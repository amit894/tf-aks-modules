variable "prefix" {
}

variable "api_server_authorized_ip_ranges" {
  default = ["201.17.87.61/32"]
}

variable "default_node_pool_vm_size" {
}

variable "default_node_pool_node_count" {
}

variable "user_node_pool_vm_size" {
}

variable "user_node_pool_node_count" {
}

variable "load_balancer_sku" {
}

variable "enable_role_based_access_control"{
}

variable "ssh_key"{
}

variable "admin_user"{
}

variable "enable_gateway"{
 default = false
}
