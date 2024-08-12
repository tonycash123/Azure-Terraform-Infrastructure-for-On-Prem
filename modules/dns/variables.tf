variable "dns_zone_name" {
  description = "The name of the Azure DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the DNS zone"
  type        = string
}
