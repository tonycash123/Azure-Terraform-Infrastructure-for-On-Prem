

output "public_ip" {
  value = {
    ip_address = azurerm_public_ip.public_ip.ip_address
  }
}