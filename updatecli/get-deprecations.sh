#!/usr/bin/env bash

# {{ $environment := (requiredEnv "CURRENT_ITER_ENVIRONMENT") }}
# {{ $aks_name := (index .environments $environment).aks_name }}
# {{ $aks_resource_group := (index .environments $environment).aks_resource_group }}
# {{ $aks_subscription := (index .environments $environment).aks_subscription }}

# "${DEPLOY_ENV}"
# $environment := requiredEnv "CURRENT_ITER_ENVIRONMENT"
NAME=sam; echo "$CURRENT_ITER_ENVIRONMENT"
NAME=sam && echo "$CURRENT_ITER_ENVIRONMENT"
$aks_name := (index .environments $environment).aks_name
$aks_resource_group := (index .environments $environment).aks_resource_group
$aks_subscription := (index .environments $environment).aks_subscription

az aks get-credentials --resource-group "$aks_resource_group" --name "$aks_name" --admin

pluto detect helm