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

# 1Password Integration
terraform {
  required_providers {
    onepassword = {
      source  = "1password/onepassword"
      version = ">= 1.0.0"
    }
  }
}

provider "onepassword" {
  token = var.onepassword_api_token
}

resource "onepassword_item" "example" {
  vault    = var.onepassword_vault
  title    = var.onepassword_item
  category = "login"
}