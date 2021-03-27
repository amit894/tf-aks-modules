locals {
  region = "southcentralus"
  vnet_cidr = ["10.1.0.0/16"]
  internal_subnet_cidr = ["10.1.0.0/24"]
  service_cidr = "192.168.0.0/17"
  docker_bridge_cidr = "192.168.128.1/17"
  dns_service_ip = "192.168.0.10"
  network_plugin = "kubenet"

  tags = {
    environment_name = "dev"
    environment_type = "nonprod"
    owner_email = "amit.894@gmail.com"
    team_rosters_product_id = 2227
  }
}
