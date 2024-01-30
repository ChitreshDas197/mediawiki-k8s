
# Mediawiki-K8S Deployment

Mediawiki has been deployed on Managed Kubernetes Cluster hosted on Azure. \
We have used AKS Cluster as the Deployment target with a node-pool of 2 workers, Azure Blob Storage to use as a remote backend for terraform statefile. \
We have used terraform as IaC tool to provision the AKS cluster, via CICD Pipeline hosted on Azure DevOps. We have use Self Hosted agent (Azure VM) for the Build and Release pipelines. \
Infra and Application uses separate repo, this repo talks about the Infra Deployment Part.
