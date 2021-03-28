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
    export AZURE_STORAGE_KEY= Storage Key of Account Created in Step 1
    ./script/createStorageAccount.sh
```

## Build Locally and Run
