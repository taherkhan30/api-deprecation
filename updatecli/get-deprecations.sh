 #!/bin/bash
# aks_name=$1
# aks_resource_group=$2
# aks_subscription=$3
# environment=$4

set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-cluster'
aks_name='my-cluster'
environment=sbox

az aks get-credentials --resource-group "${aks_resource_group}" --name "${aks_name}" --admin
pluto detect-helm 
