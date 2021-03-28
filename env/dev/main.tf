module networking {
  source  = "../../modules/networking"
  region = local.region
  vnet_cidr = local.vnet_cidr
  internal_subnet_cidr = local.internal_subnet_cidr
  prefix = var.prefix
  tags = local.tags

}
module "aks" {
  source  = "../../modules/aks"
  region = local.region
  docker_bridge_cidr = local.docker_bridge_cidr
  dns_service_ip = local.dns_service_ip
  network_plugin = local.network_plugin
  internal_subnet_id = "${module.networking.internal_subnet_id}"
  tags = local.tags
  prefix = var.prefix
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  default_node_pool_vm_size = var.default_node_pool_vm_size
  default_node_pool_node_count = var.default_node_pool_node_count
  user_node_pool_vm_size = var.user_node_pool_vm_size
  user_node_pool_node_count = var.user_node_pool_node_count
  load_balancer_sku = var.load_balancer_sku
  enable_role_based_access_control=var.enable_role_based_access_control

}
