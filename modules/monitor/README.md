# roles
Terraform Roles Modules to create Monitoring components Needed for AKS

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
