# roles
Terraform Roles Modules to create Sample Roles Needed for AKS

## Execution Steps

Initialize the terraform

``` terraform init  modules/roles/ ```

Run Terraform Plan

``` terraform plan  modules/roles/ ```

Apply the Terraform Plan

``` terraform apply  modules/roles/ ```

Variables need to be configured in variables.tf file or can be entered at the terraform cli.

## Terraform Module Environment Variables

`vnet_subnet_id`: Subnet ID for AKS Cluster for Access Scope
`principal_id`: AKS Cluster identity's Principal ID
`container_registry_id`: Container Registry ID
`kubelet_object_id`: Object Id for the Kubelet for the AKS Cluster
