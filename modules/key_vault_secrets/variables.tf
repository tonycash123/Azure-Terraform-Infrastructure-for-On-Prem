variable "key_vault_id" {
  description = "The ID or name of the Azure Key Vault."
}

variable "use_generate_secret" {
  description = "Flag to generate a new secret."
  type        = bool
  
}

variable "use_existing_secret" {
  description = "Flag to use an existing secret from Azure Key Vault."
  type        = bool
  
}

variable "postgres-administrator-login" {
  description = "The PostgreSQL administrator login username."
  type        = string
}

variable "postgres-administrator-login-password" {
  description = "The PostgreSQL administrator login password."
  type        = string
}

variable "existing_username_secret_name" {
  description = "The name of the existing secret containing the username."
  type        = string
}

variable "existing_password_secret_name" {
  description = "The name of the existing secret containing the password."
  type        = string
}
