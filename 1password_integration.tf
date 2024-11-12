# 1Password Integration
module "onepassword" {
  source = "terraform-providers/1password"
  
  # 1Password configuration
  api_key = var.onepassword_api_key
}