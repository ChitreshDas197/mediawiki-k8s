# Used variables from env which are set using TF_VAR_ prefix
# Uppercase is used as declaring env vars using TF_VAR_ makes them upper case
# Here the env variables TF_VAR_ is defined on pipeine itself as pipeline variables


variable "RG_NAME" {
  type = string
}
variable "LOCATION" {
  type    = string
#  default = "East US 2"
}
variable "CLUSTER_NAME" {
  type = string
}
variable "NODE_COUNT" {
  type = number
}