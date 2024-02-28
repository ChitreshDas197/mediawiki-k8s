variable "location" {
  type = string
  description = "Location of the K8S cluster - should be same as the location of the RG under which this will be created"
}

variable "rg_name" {
  type = string
  description = "RG name under which this will get created"
}

variable "identity" {
  type = string
}

variable "node_count" {
  type = number
  description = "Number of worker nodes needed"
}

variable "vm_size" {
  type = string
  description = "Size of VMs of the worker nodes"
}