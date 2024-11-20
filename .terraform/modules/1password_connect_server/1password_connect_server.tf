# 1Password Connect Server
terraform {
  required_providers {
    onepassword = {
      source  = "1password/onepassword"
      version = ">= 1.0.0"
    }
  }
}

variable "onepassword_connect_url" {
  description = "The URL for the 1Password Connect server"
  type        = string
}

variable "onepassword_connect_token" {
  description = "The token for the 1Password Connect server"
  type        = string
}

provider "onepassword" {
  url   = var.onepassword_connect_url
  token = var.onepassword_connect_token
}

resource "onepassword_vault" "example" {
  name = "Example Vault"
}