# tf-aks-modules
Terraform Modules to create Sample AKS Cluster


## Prerequisites

Configure the environment variables

```
   export $AZURE_STORAGE_RG_NAME=Storage Account Resource Group Name
   export $AZURE_REGION=Azure Deployment Region
   export $AZURE_STORAGE_NAME=Storage Account Name
   export $AZURE_STORAGE_SKU=Storage Account SKU
```

Create the Storage Account for Terraform Remote Backend

```
    ./script/createStorageAccount.sh
    export AZURE_STORAGE_KEY= Storage Key of Account Created previously
    ./script/createStorageAccount.sh
```


## Terraform Execution Steps

Initialize the terraform

``` terraform init  env/dev/ ```

Run Terraform Plan

``` terraform plan  env/dev/ ```

Apply the Terraform Plan

``` terraform apply  env/dev/ ```

Variables need to be configured in variables.tf file or can be entered at the terraform cli.

## Terraform Dev Environment Variables

admin_user: Admin User for SSH into AKS nodes
default_node_pool_node_count: Number of VM's for Default Node Pool
default_node_pool_vm_size: VM SKU for Default Node Pool
enable_role_based_access_control: Boolean Flag to enable Role based access on AKS Cluster
load_balancer_sku : SKU for the ILB for AKS Node
prefix : Common prefix for all Resources
ssh_key : SSH Key for Admin User for SSH Access into AKS nodes.
user_node_pool_node_count: Number of VM's for user Node Pool
user_node_pool_vm_size: VM SKU for user Node Pool

## Terraform Prod Environment Variables

Additional Variables for Production Environment

aad_admin_group_object_ids : Set of Object ID's for Admin access to Cluster
default_node_pool_cluster_auto_scaling_max_count : Max Instances in ASG for Default Node Pool
default_node_pool_cluster_auto_scaling_min_count : Min Instances in ASG for Default Node Pool
user_node_pool_cluster_auto_scaling_max_count : Max Instances in ASG for User Node Pool
user_node_pool_cluster_auto_scaling_min_count : Min Instances in ASG for User Node Pool
