variable "create_new_resource_group" {
  description = "Boolean flag to create a new resource group if true."
  type        = bool
  default     = false
}

variable "location" {
  description = "The Azure location where the resource group will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string

}

