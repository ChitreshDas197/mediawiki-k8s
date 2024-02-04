
# MEDIAWIKI_K8S_INFRA_DEPLOYMENT

- This repo is a pre-req extension of the Application Deployment Repo at "https://github.com/ChitreshDas197/mediawiki-k8s-application.git"
- This repo is used to version control the Terraform Configurations to deploy Azure Kubernetes Services and Azure Resource Group
  ## Terraform Backend:
  - Azure Containers (Blob) in Azure Storage Account (refer to section https://github.com/ChitreshDas197/mediawiki-k8s-application/tree/master#azure-storage-account-and-blob-creation)
  - The details are used in "backend.tf" file in the root directory of this repo
  ## Azure Service Principle for Terraform
  - Refer to section https://github.com/ChitreshDas197/mediawiki-k8s-application/tree/master#azure-service-principal-creation-steps
  ## Variable values
  - Passed using Pipeline variables on both CI Pipeline and Release Pipeline on Azure DevOps Pipelines
  - Use TF_VAR_ prefix for each variable and use them in UPPER CASE while declaring them (in variables.tf) or using them in other files
  - Alternatively you can use the file "terraform.tfvars" to initialize the variables (ideally do it with pipeline/env variables)
    ### CI Pipeline
    ![Pipeline Variables](https://github.com/ChitreshDas197/mediawiki-k8s-application/assets/65863286/01a008f1-8d59-4ff2-b34a-31a1280dba46)
    ### Release Pipeline
    ![Pipeline Variables - RLSE](https://github.com/ChitreshDas197/mediawiki-k8s-application/assets/65863286/e6a2994e-7696-4f99-bfe1-f2729a953ad2)

  ## Directory
    ### main.tf -> Resource definition for AKS and Resource Group
    ### variables.tf -> Declare variables
    ### backend.tf -> Configure remote backend for terraform.tfstate file (in "key" mention a name of choice ending with .tfstate)
    ### provider.tf -> Configure the provider of "azurerm"
    ### output.tf -> Declare outputs and map it to attributes from AKS resource

  ## CI Pipeline
    - Install Terraform on Agent
    - Initialize backend and install providers using
        ```bash
          terraform init \
            -backend-config="resource_group_name=${RG_NAME}" \
            -backend-config="storage_account_name=${SA_NAME}" \
            -backend-config="container_name=${BLOB_NAME}" \
            -backend-config="key=${KEY_NAME}"
        ```
    - Run below to format the HCL code and validate the syntax
        ```bash
          terraform fmt
          terraform validate
        ```
    - Run Terraform plan and Out the result to store as part of the artifact using (this can be used as evidence to proceed with release)
        ```bash
          terraform plan -out <directory>/<filename>
        ```
    - Archive and Publish it as artifact of the CI pipeline
  ## Release Pipeline
    - Extract the files from the archive package
    - Run
        ```bash
          terraform init
        ```
    - Create the resources using
        ```bash
          terraform apply --auto-approve
        ```
  

