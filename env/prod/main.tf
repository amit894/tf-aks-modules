module "networking" {
  source  = "../../modules/networking"
  region = local.region
  vnet_cidr = local.vnet_cidr
  aks_subnet_cidr = local.aks_subnet_cidr
  gateway_subnet_cidr = local.gateway_subnet_cidr
  prefix = var.prefix
  tags = local.tags
  enable_gateway = var.enable_gateway

}

module "acr" {
  source  = "../../modules/acr"
  region = local.region
  prefix = var.prefix
  tags = local.tags

}

module "monitor" {
  source  = "../../modules/monitor"
  region = local.region
  prefix = var.prefix
  tags = local.tags

}

module "aks_private" {
  source  = "../../modules/aks_private"
  region = local.region
  docker_bridge_cidr = local.docker_bridge_cidr
  dns_service_ip = local.dns_service_ip
  network_plugin = local.network_plugin
  internal_subnet_id = module.networking.aks_subnet_id
  tags = local.tags
  prefix = var.prefix
  default_node_pool_vm_size = var.default_node_pool_vm_size
  default_node_pool_node_count = var.default_node_pool_node_count
  user_node_pool_vm_size = var.user_node_pool_vm_size
  user_node_pool_node_count = var.user_node_pool_node_count
  load_balancer_sku = var.load_balancer_sku
  user_node_pool_cluster_auto_scaling_max_count = var.user_node_pool_cluster_auto_scaling_max_count
  user_node_pool_cluster_auto_scaling_min_count = var.user_node_pool_cluster_auto_scaling_min_count
  default_node_pool_cluster_auto_scaling_min_count = var.default_node_pool_cluster_auto_scaling_min_count
  default_node_pool_cluster_auto_scaling_max_count = var.default_node_pool_cluster_auto_scaling_max_count
  admin_user = var.admin_user
  aad_admin_group_object_ids = var.aad_admin_group_object_ids
  enable_role_based_access_control=var.enable_role_based_access_control
  log_analytics_workspace_id = module.monitor.oms_id

}
