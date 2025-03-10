variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default = "my-resource-group"
}

variable "location" {
  description = "Azure location"
  type        = string
  default = "East US"
}

# variable "storage_account_name" {
#   description = "Storage Account Name"
#   type        = string
#   default = "mystorageacc123"
# }
