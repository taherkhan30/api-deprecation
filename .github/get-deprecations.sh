 #!/bin/bash

set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-cluster'
aks_name='my-cluster'
environment=sbox

az aks get-credentials --resource-group "${aks_resource_group}" --name "${aks_name}" --admin
pluto detect-helm 
