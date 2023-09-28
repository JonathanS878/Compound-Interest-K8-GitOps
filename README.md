# Gitops-compound-interest

This repository contains the GitOps configurations for the DevOps application, which is a part of a larger ecosystem composed of three repositories:

 **Application**: [Application Repo](https://github.com/BinyaminR/Application-compound-interest)

 **GitOps** (Current repository): [GitOps Repo](https://github.com/BinyaminR/Gitops-compound-interest)
 
 **Infrastructure**: [Infrastructure Repo](https://github.com/BinyaminR/Infrastructure-compound-interest)

## Overview

The GitOps repository serves as the source of truth for the desired state of the application deployed on Kubernetes. It contains a Helm chart for deploying the application and two scripts for testing connectivity between pods and updating the image version based on tests in a previous environment.

### Key Components:

1. **Helm Chart**: It includes the necessary Kubernetes manifests (deployment, service, etc.) templated for dynamic configurations. Helm is used to package and deploy the application on Kubernetes clusters.

2. **Connectivity Test Script**: This script is used for testing the connectivity between pods in a testing environment. Ensuring that pods can communicate with each other is critical before moving to the production environment.

3. **Update Image Script**: This script updates the Docker image version in the Helm chart based on the tests conducted in a previous environment. If the tests pass, the script will update the Helm chart with the new image version, thereby triggering a new deployment.

## Continuous Deployment (CD) and Automation

The Continuous Deployment (CD) aspect of the application is managed through ArgoCD, a declarative GitOps continuous delivery tool for Kubernetes. ArgoCD automates the synchronization of applications defined in a Git repository (like this one) with a specified target environment, ensuring that the environment is always consistent with the configurations defined in this repository.

### How it Works:

- ArgoCD is set up to continuously monitor this GitOps repository. Any changes pushed to the repository are detected by ArgoCD.

- When a change is detected (e.g., an updated Docker image version), ArgoCD synchronizes the cluster state with the desired state defined in this repository by applying the updated Helm chart. This ensures that the application running on the GKE cluster is always up-to-date with the latest changes.

- By automating the deployment process with ArgoCD, we minimize manual intervention and ensure that the application is deployed consistently across different environments (dev, staging, production, etc.).

