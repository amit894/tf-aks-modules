# tf-aks-modules
Terraform Modules to create Sample AKS Cluster


## Prerequisites

Configure the environment variables
```export $AZURE_STORAGE_RG_NAME=Storage Account Resource Group Name__```
```export $AZURE_REGION=Azure Deployment Region__```
```export $AZURE_STORAGE_NAME=Storage Account Name__```
```export $AZURE_STORAGE_SKU=Storage Account SKU__```

Create the Storage Account for Terraform Remote Backend

``` ./script/createStorageAccount.sh__```
```export AZURE_STORAGE_KEY= Storage Key of Account Created in Step 1__```
``` ./script/createStorageAccount.sh__```

## Build Locally and Run
