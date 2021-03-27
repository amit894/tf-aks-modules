variable "prefix" {
  description = "Prefix to be used for resources to will be created"
  default = "test-app"
}

variable "region" {
  description = "Region name where rg will be hosted"
  default = "eastus"
}

variable "storage_account_name" {
  description = "Prefix to be used for resources to will be created"
  default = "testappaks894"
}

variable "storage_account_tier" {
  description = "Region name where rg will be hosted"
  default = "Standard"
}

variable "storage_account_sku" {
  description = "Prefix to be used for resources to will be created"
  default = "RAGRS"
}

variable "storage_container_name" {
  description = "Container Name to be used"
  default = "tf-states"
}
