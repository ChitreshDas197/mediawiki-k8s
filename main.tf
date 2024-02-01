resource "azurerm_resource_group" "mediawiki_rg" {
  name     = var.RG_NAME
  location = var.LOCATION
}

resource "azurerm_kubernetes_cluster" "mediawiki-k8s-cluster" {
  name                = var.CLUSTER_NAME
  location            = azurerm_resource_group.mediawiki_rg.location
  resource_group_name = azurerm_resource_group.mediawiki_rg.name
  dns_prefix          = "mediawiki-dns"

  default_node_pool {
    name       = "default"
    node_count = var.NODE_COUNT
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}