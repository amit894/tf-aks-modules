variable "prefix" {
  description = "Prefix to be used for resources to will be created"
  default = "test-app"
}

variable "region" {
  description = "Region name where rg will be hosted"
  default = "eastus"
}

variable "vnet_cidr" {
  description = "CIDR of the VNET for hosting"
  default = ["10.0.0.0/16"]

}

variable "internal_subnet_cidr" {
  description = "CIDR of the internal subnet for hosting"
  default = ["10.0.0.0/24"]
}

variable "api_server_authorized_ip_ranges" {
  description = "CIDR block of the Corporate CIDR"
  default = ["201.17.87.61/32"]
}

variable "default_node_pool_vm_size" {
  description = "Default Node Pool VM Size"
  default = "Standard_D2_v2"
}

variable "user_node_pool_vm_size" {
  description = "User Node Pool VM Size"
  default = "Standard_D2_v2"
}
