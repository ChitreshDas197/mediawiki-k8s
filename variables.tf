# Used variables from env which are set using TF_VAR_ prefix
# Uppercase is used as declaring env vars using TF_VAR_ makes them upper case
# Here the env variables TF_VAR_ is defined on pipeine itself as pipeline variables
# You can also initialize these variables using terraform.tfvars file using the below variable names in a key value pair


variable "RG_NAME" {
  type = string
}
variable "LOCATION" {
  type    = string
#  default = "East US 2"
}
variable "IDENTITY" {
  type = string
}
variable "VM_SIZE" {
  type = string
}
variable "NODE_COUNT" {
  type = number
}