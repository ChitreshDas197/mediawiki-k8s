resource "azurerm_kubernetes_cluster" "mediawiki-k8s-cluster" {
  name                = "${var.rg_name}-mediawiki-cluster"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.rg_name}-mwiki-k8s"
  
  default_node_pool {
    name       = "${var.location}pool"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = var.identity
  }
}