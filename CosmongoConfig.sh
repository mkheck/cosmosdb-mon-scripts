#!/bin/bash
# Author  : Mark A. Heckler
# Notes   : Run with 'source CosmongoConfig.sh' from your shell/commandline environment AFTER CosmongoInitEnv.sh
# History : Official "version 1" 20221212.
#         : Mods to streamline Spring Data demo 20221215.

# REQUIREMENTS
## Azure CLI (az)

# Resource group config
echo '>> az group create -l $AZ_LOCATION -g $AZ_RESOURCE_GROUP --subscription $AZ_SUBSCRIPTION'
az group create -l $AZ_LOCATION -g $AZ_RESOURCE_GROUP --subscription $AZ_SUBSCRIPTION

## Cosmos/Mongo option
echo '>> az cosmosdb create -n $COSMOSDB_MON_ACCOUNT -g $AZ_RESOURCE_GROUP --kind MongoDB --server-version 4.0'
az cosmosdb create -n $COSMOSDB_MON_ACCOUNT -g $AZ_RESOURCE_GROUP --kind MongoDB --server-version 4.0
echo '>> az cosmosdb mongodb database create -a $COSMOSDB_MON_ACCOUNT -n mkheck-my-test-db -g $AZ_RESOURCE_GROUP --verbose'
az cosmosdb mongodb database create -a $COSMOSDB_MON_ACCOUNT -n $COSMOSDB_MON_NAME -g $AZ_RESOURCE_GROUP --verbose

# For Azure Cosmos DB for MongoDB, a single URL connection string (URL+key)
# export COSMOSDB_MON_URL=$(az cosmosdb show -n $COSMOSDB_MON_ACCOUNT -g $AZ_RESOURCE_GROUP --query documentEndpoint --output tsv)
export COSMOSDB_MON_URL=$(az cosmosdb keys list --type connection-strings -n $COSMOSDB_MON_ACCOUNT -g $AZ_RESOURCE_GROUP --query "connectionStrings[0].connectionString" --output tsv)

# Spring Data env vars to enable "automatic" migration of your app to a cloud-based instance of Azure Cosmos DB for MongoDB
export SPRING_DATA_MONGODB_URI=$COSMOSDB_MON_URL
export SPRING_DATA_MONGODB_DATABASE=$COSMOSDB_MON_NAME
