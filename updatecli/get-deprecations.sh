 #!/bin/bash
       
set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-cluster'
aks_name='my-cluster'
environment=sbox

# get pluto output 
get-deprecations () {
    az aks get-credentials \
        --resource-group "${aks_resource_group}" \
        --name "${aks_name}" \
    output=`./pluto detect-helm -o markdown --ignore-deprecations --ignore-removals`
    echo $output
    export output
}
$(get_deprecations)
DEPRECATIONS=$(get_deprecations)
echo "${DEPRECATIONS}"