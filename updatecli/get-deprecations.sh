 #!/bin/bash

set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-cluster'
aks_name='my-cluster'
environment=sbox

# get cluster infp 

# loopp through enabled clusters and get deprecations 
get_deprecations () {
    az aks get-credentials \
        --resource-group "${aks_resource_group}" \
        --name "${aks_name}" --admin
    pluto detect-helm 
    kubectl get namespaces
}
$(get_deprecations)
OUTPUT=$(get_deprecations)
echo "MESSAGE=$OUTPUT" >> $GITHUB_ENV