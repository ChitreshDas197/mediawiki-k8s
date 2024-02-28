resource "azurerm_kubernetes_cluster" "mediawiki-k8s-cluster" {
  name                = "${var.location}-${var.cluster_name}"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix
  
  default_node_pool {
    name       = "${var.location}-${var.node_pool_name}"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = var.identity
  }
}