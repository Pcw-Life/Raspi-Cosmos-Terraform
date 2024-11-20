# Cloudflare Workers
provider "cloudflare" {
  version = ">= 2.0.0"
  api_token = var.cloudflare_api_token
}

resource "cloudflare_worker_script" "example" {
  name = var.cloudflare_worker_name
  content = file("path/to/worker/script.js")
}