terraform {
  backend "azurerm" {
    resource_group_name  = "mediawiki-devops-rg"
    storage_account_name = "terrastatefileaccount"
    container_name       = "tfstateblob"
    key                  = "mediawiki.terraform.tfstate"
  }
}
