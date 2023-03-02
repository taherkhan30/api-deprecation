 #!/bin/bash

set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-cluster'
aks_name='my-cluster'
environment=sbox

# get pluto output 
get_deprecations () {
    az aks get-credentials \
        --resource-group "${aks_resource_group}" \
        --name "${aks_name}" --admin
    `pluto detect-helm --helm-version=2 -v 8`
    `kubectl get namespaces`
}
$(get_deprecations)
DEPRECATIONS=$(get_deprecations)
echo "${DEPRECATIONS}"