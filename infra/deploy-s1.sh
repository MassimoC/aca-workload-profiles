#!/bin/bash
. ./variables.sh

echo "${DBG}... Login"
#az login --tenant 7517bc42-bcf8-4916-a677-111111111

echo "${DBG}... Set subscription"
#az account set --subscription c1537527-c126-428d-11111111

projectName='heyprofilez'

echo "${DBG}... Trigger INFRA deployment on $projectName"

az stack sub create --name "acaprofiles" --template-file scenario1.bicep --parameters project=$projectName --location westeurope --deny-settings-mode None --yes

echo "${DBG}... Trigger APP deployment on $projectName"

az stack sub create --name "apps-s1" --template-file scenario1-apps.bicep --parameters project=$projectName --location westeurope --deny-settings-mode None --yes

echo "${DBG}... Script completed"
