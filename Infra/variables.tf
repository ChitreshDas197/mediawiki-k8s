# Below variables are used for authenticating terrfarm with Azure via Service Principle and Client Secret
# Input values from environment variables (recommended) / *tfvars file (please add *tfvars in .gitignore while checking in the code to VCS)

variable "client_id" {
  
}
variable "client_secret" {
  
}
variable "subscription_id" {
  
}
variable "tenant_id" {
  
}


#Below variables are used for resource group
# I have used east us 2 as azure region - give your preferred region as default or via *.tfvars file as applicable

variable "rgname" {
  type = string
}
variable "location" {
  type = string
  default = "East US 2"
}

