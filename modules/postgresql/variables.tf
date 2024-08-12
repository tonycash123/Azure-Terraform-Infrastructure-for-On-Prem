variable "server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "location" {
  description = "The location of the PostgreSQL server"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "databases" {
  description = "The list of PostgreSQL databases to create"
  type        = list(string)
}

variable "postgres_administrator_login" {
  description = "PostgreSQL administrator login username."
  type        = string
}

variable "postgres_administrator_login_password" {
  description = "PostgreSQL administrator login password."
  type        = string
}