# 1Password Integration
provider "onepassword" {
  version = ">= 1.0.0"
  token   = var.onepassword_api_token
}

resource "onepassword_item" "example" {
  vault    = var.onepassword_vault
  title    = var.onepassword_item
  category = "login"
}