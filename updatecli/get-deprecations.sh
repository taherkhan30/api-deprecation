 #!/bin/bash
aks_name=$1
aks_resource_group=$2
aks_subscription=$3
environment=$4

az aks get-credentials --resource-group "${aks_resource_group}" --name "${aks_name}" --admin
pluto detect-helm 
