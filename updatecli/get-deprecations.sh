#! /usr/bin/env bash
set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-cluster'
aks_name='my-cluster'
department='cft'

# get pluto output 
get-deprecations () {
    az aks get-credentials \
        --resource-group "${aks_resource_group}" \
        --name "${aks_name}" \
    output=`./pluto detect-helm -o markdown --ignore-deprecations --ignore-removals`
    echo $output
    export output
}

DEPRECATIONS=$(get_deprecations)

# #! /usr/bin/env bash
# set -x
# az account set --subscription $1
# aks_resource_group=$2
# aks_name=$3
# environment=$4
# department=$5
# {
# printf "\n\nTrying cluster $aks_name $aks_resource_group\n"
# az aks get-credentials \
#     --resource-group $aks_resource_group \
#     --name $aks_name --admin
# # Return false and fallback to cluster 01 if cluster returns 0 ingress objects
# $(kubectl get ingress --context "$aks_name-admin" --all-namespaces=true -o \
#     go-template='{{ $length := len .items }} {{ if eq $length 0 }}false{{ end }}')
# } || {
# aks_resource_group=$(echo $aks_resource_group|sed 's/-00-/-01-/g')
# aks_name=$(echo $aks_name|sed 's/-00-/-01-/g')
# printf "\n\nTrying cluster $aks_name $aks_resource_group\n"
# az aks get-credentials \
#     --resource-group $aks_resource_group \
#     --name $aks_name --admin
# }
