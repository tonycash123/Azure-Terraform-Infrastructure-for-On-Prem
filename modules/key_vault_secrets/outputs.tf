output "postgres_administrator_username" {
  description = "The PostgreSQL administrator username stored in Key Vault."
  value       = data.azurerm_key_vault_secret.postgres_username.value
}

output "postgres_administrator_password" {
  description = "The PostgreSQL administrator password stored in Key Vault."
  value       = data.azurerm_key_vault_secret.postgres_password.value
}