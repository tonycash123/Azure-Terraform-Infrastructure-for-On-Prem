output "container_group_name" {
  value = {
    container_group_name = azurerm_container_group.container_group.name
  }
}
