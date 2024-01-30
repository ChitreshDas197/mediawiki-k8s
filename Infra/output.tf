output "kube_config" {
  value = azurerm_kubernetes_cluster.mediawiki-k8s-cluster.kube_config_raw

  sensitive = true
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.mediawiki-k8s-cluster.fqdn
}

output "node-rg" {
  value = azurerm_kubernetes_cluster.mediawiki-k8s-cluster.node_resource_group
}