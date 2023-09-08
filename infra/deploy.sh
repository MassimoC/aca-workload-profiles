#!/bin/bash
. ./variables.sh

echo "${DBG}... Login"
#az login --tenant 7517bc42-bcf8-4916-a677-b5753051f846

echo "${DBG}... Set subscription"
#az account set --subscription c1537527-c126-428d-8f72-1ac9f2c63c1f

echo "${DBG}... Trigger deployment"
az stack sub create --name "acaprofiles" --template-file scenario1.bicep --location westeurope --deny-settings-mode None --yes

echo "${DBG}... Script completed"
