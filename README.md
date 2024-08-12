# Azure Terraform Infrastructure for On-Prem

This repository contains the Terraform configuration files for setting up the On-Prem infrastructure on Azure.

## Prerequisites

Before running this code, make sure you have the following prerequisites:

- Azure Service Principal credentials
- Terraform 1.8.3
- Azure CLI

## Local Environment Setup

Follow these steps to set up the project:

1. **Install Azure CLI**: Make sure you have the Azure CLI installed on your local machine.
2. **Initialize Azure CLI with credentials**: Authenticate the Azure CLI with your Azure credentials.

## Configuration Variables (`dev.tfvars`)

Here's a brief description of the variables in the `dev.tfvars` file:

- `use_generate_secret`: A flag to generate a new secret.
- `use_existing_secret`: A flag to use an existing secret from Azure Key Vault.
- `postgres-administrator-login`: The PostgreSQL administrator login username.
- `postgres-administrator-login-password`: The PostgreSQL administrator login password.
- `existing_username_secret_name`: The name of the existing secret containing the PostgreSQL username.
- `existing_password_secret_name`: The name of the existing secret containing the PostgreSQL password.
- `key_vault_id`: The ID or name of the Azure Key Vault.
- `server_name`: The name of the PostgreSQL server.
- `location`: The location for the resource group and resources.
- `resource_group_name`: The name of the resource group.
- `databases`: A list of databases to be created on the PostgreSQL server.

## Variable Details

### `use_generate_secret`
- **Description:** A flag to generate a new secret.
- **Type:** bool
- **default:** true

### `use_existing_secret`
- **Description:** A flag to use an existing secret from Azure Key Vault.
- **Type:** bool
- **default:** false

### `postgres-administrator-login`
- **Description:** The PostgreSQL administrator login username.
- **Type:** string

### `postgres-administrator-login-password`
- **Description:** The PostgreSQL administrator login password.
- **Type:** string

### `existing_username_secret_name`
- **Description:** The name of the existing secret containing the PostgreSQL username.
- **Type:** string

### `existing_password_secret_name`
- **Description:** The name of the existing secret containing the PostgreSQL password.
- **Type:** string

### `key_vault_id`
- **Description:** The ID or name of the Azure Key Vault.
- **Type:** string

### `pg_server_name`
- **Description:** The name of the PostgreSQL server.
- **Type:** string

### `location`
- **Description:** The location for the resource group and resources.
- **Type:** string

### `resource_group_name`
- **Description:** The name of the resource group.
- **Type:** string

### `pg_databases`
- **Description:** A list of databases to be created on the PostgreSQL server.
- **Type:** list(string)

## How to Use

1. Update the `dev.tfvars` file with your specific configuration values.
2. Run `terraform init -backend-config='dev.config'`.
3. Run `terraform plan -var-file=dev.tfvars` to see the changes that will be made.
4. Run `terraform apply -var-file=dev.tfvars` to apply the changes.

Please ensure you have the necessary permissions and the Azure CLI installed and configured before running these commands.

## CI/CD

All changes are applied in the CI. On EVERY Pull Request, the version should be bumped (patch if no other changes are required).

- **On a PR**: `init` & `plan` are run on CI without `apply`.
- **On merge of PR to main**: `init`, `plan` & `apply` are run on Insait's Azure subscription (dev).

## Modules

This repository contains several modules, each responsible for creating a specific resource in Azure. These modules include:

- `linux_virtual_machine`: Creates a Linux virtual machine.
- `container_registry`: Creates an Azure Container Registry.
- `postgresql`: Creates a PostgreSQL server and databases.
- `dns`: Creates a DNS zone.
- `virtual_network`: Creates a virtual network.
- `subnet`: Creates a subnet within the virtual network.
- `resource_group`: Creates a resource group to deploy the infrastructure.

## Key Vault and Secrets Management

This configuration includes the management of Azure Key Vault and secrets with the following resources:

- `random_password.generated_password`: Generates a random password with special characters.
- `random_string.generated_username`: Generates a random username without special characters.
- `azurerm_key_vault_secret.postgres_username_secret`: Stores the PostgreSQL admin username in the Key Vault.
- `azurerm_key_vault_secret.postgres_password_secret`: Stores the PostgreSQL admin password in the Key Vault.
- `azurerm_key_vault_secret`: Retrieves an existing secret from the Key Vault.

## Administrator Credentials and Secret Options

The following variables allow you to manage the administrator credentials and secrets:

- `postgres-administrator-login`: The PostgreSQL admin login username retrieved from Azure Key Vault or provided directly.
- `postgres-administrator-login-password`: The PostgreSQL admin login password retrieved from Azure Key Vault or provided directly.

### Usage
The configuration uses the following variables:
- `var.use_generate_secret`: Set this variable to `true` to generate new PostgreSQL administrator credentials using `random_string.generated_username.result` for username and `random_password.generated_password.result` for password. Set it to `false` to use the provided credentials (`var.postgres_administrator_login` for username and `var.postgres_administrator_login_password` for password).
  
- `var.use_existing_secret`: Set this variable to `true` to use existing PostgreSQL administrator credentials stored in Azure Key Vault. This condition determines whether the resources for creating new secrets (`azurerm_key_vault_secret.postgres_username_secret` and `azurerm_key_vault_secret.postgres_password_secret`) will be skipped (`count = 0`).
