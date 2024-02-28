# The below is needed when using Service Principal and Client Secret to authenticate with Azure
# An empty block is initialized with backend "azurerm"
# The required 4 config values are passed using -backend-config="KEY=VALUE" in "terraform init" command in the CI CD Pipeline
# The VALUE is read from env/pipeline variables set using "RG_NAME", "SA_NAME", "BLOB_NAME" and "KEY_NAME" respectively

# In my example these are configured on the pipeline init stage - can be overwritten

terraform {
  backend "azurerm" {
    resource_group_name = "support"
    storage_account_name = "mwikisatestore"
    container_name = "stateblob"
    key = "mwiki.terraform.tfstate"
  }
}