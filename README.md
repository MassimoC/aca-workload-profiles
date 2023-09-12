# Azure Container Apps workload profiles

## Scenario 1

The scenario 1 deploys :
- 3 dedicated-workloads D4
    - every profile has 7 instances (no scale, min=max)
- 1 consumption-workload
- 28 replicas of 1-core app per dedicated-profile (4 app per node) to reserve all the available CPU resource
- 20 replicas of 1-core app in the consumption profile

![](imgs/acaprofiles-scenario1.jpg)

## Scenario 2



