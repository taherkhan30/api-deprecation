#!/usr/bin/env bash

aks_name=my-cluster
aks_resource_group=rg-cluster
aks_subscription=Pay-As-You-Go
environment=sbox

get_upgrades () {
  az aks get-upgrades \
      --name "${aks_name}" \
      --resource-group "${aks_resource_group}" \
      --subscription "${aks_subscription}" \
      | jq -r '
      if (.controlPlaneProfile.upgrades|map(select(.isPreview == null)) == []) then
          .controlPlaneProfile.kubernetesVersion
      else .controlPlaneProfile.upgrades|map(select(.isPreview == null).kubernetesVersion)
      | .[] end' \
      | sort --reverse --version-sort | head --lines 1

}

UPGRADE_VERSION=$(get_upgrades)


# For environments usually only running one cluster at a time
# check the second cluster if response from 00 is empty
if [[ ${UPGRADE_VERSION} == "" ]] && [[ ${environment} =~ ^(preview|demo)$ ]]; then

  aks_name=$(echo "${aks_name}" | sed -E "s/00/01/g" )
  aks_resource_group=$(echo "${aks_resource_group}" | sed -E "s/00/01/g" )

  UPGRADE_VERSION=$(get_upgrades)

fi

echo "${UPGRADE_VERSION}"

# get pluto output 
get-deprecations () {
    az aks get-credentials \
        --resource-group "${aks_resource_group}" \
        --name "${aks_name}"
    output=`./pluto detect - -o markdown --ignore-deprecations --ignore-removals`
    echo $output
    
}

DEPRECATIONS=$(get_deprecations)