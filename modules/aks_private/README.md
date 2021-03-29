# roles
Terraform Roles Modules to create Advanced AKS Cluster for Production

## Execution Steps

Initialize the terraform

- ``` terraform init  modules/roles/ ```

Run Terraform Plan

- ``` terraform plan  modules/roles/ ```

Apply the Terraform Plan

- ``` terraform apply  modules/roles/ ```

Variables need to be configured in variables.tf file or can be entered at the terraform cli.

## Terraform Module Environment Variables

- `prefix`: Prefix to be used for Resources to will be created
- `region`: Region name where Resources will be hosted
- `tags`: Tags for the resource
- `aad_admin_group_object_ids` : Set of Object ID's for Admin access to Cluster
- `default_node_pool_cluster_auto_scaling_max_count` : Max Instances in ASG for Default Node Pool
- `default_node_pool_cluster_auto_scaling_min_count` : Min Instances in ASG for Default Node Pool
- `user_node_pool_cluster_auto_scaling_max_count` : Max Instances in ASG for User Node Pool
- `user_node_pool_cluster_auto_scaling_min_count` : Min Instances in ASG for User Node Pool
- `admin_user`: Admin User for SSH into AKS nodes
- `default_node_pool_node_count`: Number of VM's for Default Node Pool
- `default_node_pool_vm_size`: VM SKU for Default Node Pool
- `enable_role_based_access_control`: Boolean Flag to enable Role based access on AKS Cluster
- `load_balancer_sku` : SKU for the ILB for AKS Node
- `prefix` : Common prefix for all Resources
- `ssh_key` : SSH Key for Admin User for SSH Access into AKS nodes.
- `user_node_pool_node_count`: Number of VM's for user Node Pool
- `user_node_pool_vm_size`: VM SKU for user Node Pool
