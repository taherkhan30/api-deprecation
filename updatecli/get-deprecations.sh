 #!/bin/bash

{{ $environment := (requiredEnv "CURRENT_ITER_ENVIRONMENT") }}
{{ $aks_name := (index .environments $environment).aks_name }}
{{ $aks_resource_group := (index .environments $environment).aks_resource_group }}
{{ $aks_subscription := (index .environments $environment).aks_subscription }}

# aks_name=$1
# aks_resource_group=$2
# aks_subscription=$3
# environment=$4

# set -x
# az account set --subscription 'Pay-As-You-Go'
# aks_resource_group='rg-cluster'
# aks_name='my-cluster'
# environment=sbox

az aks get-credentials --resource-group "${aks_resource_group}" --name "${aks_name}" --admin
pluto detect-helm 
