#!/bin/bash
# Author  : Mark A. Heckler
# Notes   : Run with 'source CosmongoInitEnv.sh' from your shell/commandline environment
# History : Official "version 1" 20221212.
#         : Mods to streamline Spring Data demo 20221215.

# REQUIREMENTS
## Azure CLI (az)

# Your Azure ID
export AZUREID='<your_azure_id>'

# Establish seed for random naming
export RANDOMIZER=$RANDOM

# Azure subscription to use
export AZ_SUBSCRIPTION='<insert_your_azure_subscription_here>'
export AZ_RESOURCE_GROUP=$AZUREID'-'$RANDOMIZER'-rg'
export AZ_LOCATION='eastus'

# Database
export COSMOSDB_MON_ACCOUNT=$AZUREID'-'$RANDOMIZER'-mongoacct'
export COSMOSDB_MON_NAME=$AZUREID'-'$RANDOMIZER'-mongodb'

# For MongoDB API, a single URL connection string (URL+key)
# export COSMOSDB_MON_URL=$(az cosmosdb keys list --type connection-strings -n $COSMOSDB_MON_ACCOUNT -g $AZ_RESOURCE_GROUP --query "connectionStrings[0].connectionString" --output tsv)
