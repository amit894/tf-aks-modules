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
  default = "testapptfstate"
}

variable "storage_account_tier" {
  description = "Region name where rg will be hosted"
  default = "Standard"
}

variable "storage_account_sku" {
  description = "Prefix to be used for resources to will be created"
  default = "RAGRS"
}
