# Check if the resource group exists
data "azurerm_resource_group" "existing_rg" {
  name  = var.resource_group_name
  count = var.create_new_resource_group ? 0 : 1
}

# Create a new resource group if the flag is set to true
resource "azurerm_resource_group" "rg" {
  count    = var.create_new_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}