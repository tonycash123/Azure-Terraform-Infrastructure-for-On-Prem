

resource "random_password" "generated_password" {
  length           = 20
  special          = true
  override_special = "_%@"
  keepers = {
    generate = var.use_generate_secret 
  }
}

resource "random_string" "generated_username" {
  length           = 10
  special          = false
  upper            = false
  lower            = true
  numeric          = true
  keepers = {
    generate = var.use_generate_secret
  }
}

resource "azurerm_key_vault_secret" "postgres_username_secret" {
  count        = var.use_existing_secret ? 0 : 1
  name         = "postgres-administrator-username"
  value        = var.use_generate_secret ? random_string.generated_username.result : var.postgres-administrator-login
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "postgres_password_secret" {
  count        = var.use_existing_secret ? 0 : 1
  name         = "postgres-administrator-password"
  value        = var.use_generate_secret ? random_password.generated_password.result : var.postgres-administrator-login-password
  key_vault_id = var.key_vault_id
}


data "azurerm_key_vault_secret" "postgres_username" {
  name         = var.use_existing_secret ? var.existing_username_secret_name : "postgres-administrator-username"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "postgres_password" {
  name         = var.use_existing_secret ? var.existing_password_secret_name : "postgres-administrator-password"
  key_vault_id = var.key_vault_id
}