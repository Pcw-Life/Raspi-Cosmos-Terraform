# Variables for 1Password Integration
variable "database_type" {
  description = "The type of database to deploy (mysql or mongodb)"
  type        = string
}

variable "onepassword_api_token" {
  description = "The API token for the 1Password provider"
  type        = string
}

variable "onepassword_vault" {
  description = "The name of the 1Password vault"
  type        = string
}

variable "onepassword_item" {
  description = "The name of the 1Password item"
  type        = string
}

# Terraform block for required provider
terraform {
  required_providers {
    onepassword = {
      source  = "1password/onepassword"
      version = ">= 1.0.0"
    }
  }
}

# Provider configuration
provider "onepassword" {
  token = var.onepassword_api_token
}

# Example resource for 1Password
resource "onepassword_item" "example" {
  vault    = var.onepassword_vault
  title    = var.onepassword_item
  category = "login"
  fields = [
    {
      label = "username"
      value = "example_username"
      type  = "string"
    },
    {
      label = "password"
      value = "example_password"
      type  = "concealed"
    }
  ]
}