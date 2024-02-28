resource "azurerm_kubernetes_cluster" "mediawiki-k8s-cluster" {
  name                = "${var.location}-mediawiki-cluster"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "${var.location}-mwiki-k8s"
  
  default_node_pool {
    name       = "${var.location}-k8s-node-pool"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = var.identity
  }
}