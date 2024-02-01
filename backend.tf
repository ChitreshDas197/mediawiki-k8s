terraform {
  backend "azurerm" {
    resource_group_name  = "supportRG"
    storage_account_name = "tfstatestoreacc01"
    container_name       = "tfstateblob"
    key                  = "mediawiki.terraform.tfstate"
  }
}
