# roles
Terraform Roles Modules to create Networking components Needed for AKS

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
- `vnet_cidr`: CIDR of the VNET for hosting
- `aks_subnet_cidr`: CIDR of the aks subnet for hosting
- `gateway_subnet_cidr`: CIDR of the gateway subnet for hosting
- `enable_gateway`: Flag to add the gateway subnet
- `tags`: Tags for the resource
