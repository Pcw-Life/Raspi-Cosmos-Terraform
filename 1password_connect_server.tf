# 1Password Connect Server
provider "onepassword" {
  version = ">= 1.0.0"
  url     = var.onepassword_connect_url
  token   = var.onepassword_connect_token
}

resource "onepassword_vault" "example" {
  name = "Example Vault"
}