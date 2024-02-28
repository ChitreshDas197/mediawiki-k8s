module "rg_module" {
  source = "./modules/rg_module"
  rg_name = var.RG_NAME
  location = var.LOCATION
}

module "aks_module" {
  source = "./modules/aks_module"
  cluster_name = var.CLUSTER_NAME
  location = var.LOCATION 
  rg_name = var.RG_NAME
  dns_prefix = var.DNS_PREFIX
  identity = var.IDENTITY
  node_pool_name = var.NODE_POOL_NAME
  node_count = var.NODE_COUNT
  vm_size = var.VM_SIZE

  depends_on = [ module.rg_module ]
}