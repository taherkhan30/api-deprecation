 #!/bin/bash

# $environment := (requiredEnv "CURRENT_ITER_ENVIRONMENT")
# $aks_name := (index .environments $environment).aks_name
# $aks_resource_group := (index .environments $environment).aks_resource_group
# $aks_subscription := (index .environments $environment).aks_subscription

# aks_name=$1
# aks_resource_group=$2
# aks_subscription=$3
# environment=$4

# yq -r '.environments.sbox | to_entries[].value | split(":")[0]' values.github-action.yaml

# yq -r '.environments | to_entries | map(select(.value.enabled == true)) | .[].key' ./values.github-action.yaml

# yq -r '.environments.sbox | to_entries | map(select(.value.enabled == true)) | .[].key' ./values.github-action.yaml

# yq "$environments,sbox" ./values.github-action.yaml

# yq -r '.environments.sbox' ./values.github-action.yaml

# aks_name=$(yq -r '.environments[].aks_name' ./values.github-action.yaml
# aks_rg_array=(aks_resource_group=$(yq -r '.environments[].aks_resource_group' ./values.github-action.yaml))
# aks_subscription=$(yq -r '.environments[].aks_subscription' ./values.github-action.yaml)
# aks_rg_array=(aks_aks_resource_group=$(yq -r '.environments[].aks_resource_group' ./values.github-action.yaml))

#         yq -r '.environments[].aks_name | to_entries | .[].key' ./values.github-action.yaml | while read i
#           do
#               CURRENT_ITER_ENVIRONMENT="$i" updatecli apply --config ./updatecli/updatecli.d --values ./values.github-action.yaml
#                 echo "$i"
#           done

# aks_rg=
# for i in ${aks_rg_array[@]}
# do 
#     echo "i"
#     # az aks get-credentials --resource-group "${aks_rg_array}" --name "${aks_array}" --admin

# done 


# # pluto detect-helm

# - if apply has been ran then trigger pluto pipeline 
# -   https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/github-actions?view=azure-devops
# - update pr using azure devops task 
# - 

{{ $environment := (requiredEnv "CURRENT_ITER_ENVIRONMENT") }}
{{ $aks_name := (index .environments $environment).aks_name }}
{{ $aks_resource_group := (index .environments $environment).aks_resource_group }}
{{ $aks_subscription := (index .environments $environment).aks_subscription }}

az aks get-credentials --resource-group "$aks_resource_group" --name "$aks_name" --admin

pluto detect helm