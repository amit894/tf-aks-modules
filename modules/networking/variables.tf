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

variable "tags" {
  description = "Tags for the resource"
  default = {
    environment_name = "dev"
    owner_email = "amit.894@gmail.com"
    }
}
