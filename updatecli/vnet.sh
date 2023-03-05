#!/usr/bin/env bash

mapfile -t vnetRULEname < <(az network vnet subnet list -g main-rg --vnet-name vnet-src --query "[].{name:name}" -o table)
mapfile -t vnetRULEid < <(az network vnet subnet list -g main-rg --vnet-name vnet-dst --query "[].{objectID:id}" -o table)

# Remove the headers from each
unset 'vnetRULE'{name,id}{'[0]','[1]'}

for idx in "${!vnetRULEname[@]}"; do

  name=${vnetRULEname[$idx]}

  id=${vnetRULEid[$idx]}

  az mysql server vnet-rule create \
    -n "$name" \
    -g resourcegroup \
    -s servername \
    --subnet "$id"
done