
#Below variables are used for resource group
# I have used east us 2 as azure region - give your preferred region as default or via *.tfvars file as applicable

variable "rgname" {
  type = string
}
variable "location" {
  type    = string
  default = "East US 2"
}
variable "clusterName" {
  type = string
}
variable "node_count" {
  type = number
}
