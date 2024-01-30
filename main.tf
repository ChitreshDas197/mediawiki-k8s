resource "azurerm_resource_group" "mediawiki_rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_kubernetes_cluster" "mediawiki-k8s-cluster" {
  name                = var.clusterName
  location            = azurerm_resource_group.mediawiki_rg.location
  resource_group_name = azurerm_resource_group.mediawiki_rg.name
  dns_prefix          = "mediawiki-dns"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_D2_v2" 
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.mediawiki-k8s-cluster]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.mediawiki-k8s-cluster.kube_config_raw
}


