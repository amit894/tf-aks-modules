# tf-aks-modules
Terraform Modules to create Sample AKS Cluster


## Prerequisites

Configure the environment variables
```export $AZURE_STORAGE_RG_NAME=Storage Account Resource Group Name <br />```
```export $AZURE_REGION=Azure Deployment Region <br />```
```export $AZURE_STORAGE_NAME=Storage Account Name <br />```
```export $AZURE_STORAGE_SKU=Storage Account SKU <br />```

Create the Storage Account for Terraform Remote Backend

``` ./script/createStorageAccount.sh <br />```
```export AZURE_STORAGE_KEY= Storage Key of Account Created in Step 1 <br />```
``` ./script/createStorageAccount.sh <br />```

## Build Locally and Run
