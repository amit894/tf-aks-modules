az group create --name $AZURE_STORAGE_RG_NAME -l $AZURE_REGION
az storage account create --name $AZURE_STORAGE_NAME --sku $AZURE_STORAGE_SKU --resource-group $AZURE_STORAGE_RG_NAME -l $AZURE_REGION
