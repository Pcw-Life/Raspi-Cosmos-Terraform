# Cloudflare Workers
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 2.0.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_account_id" {
  description = "The Cloudflare account ID"
  type        = string
}

variable "cloudflare_worker_name" {
  description = "The name of the Cloudflare Worker script"
  type        = string
}

resource "cloudflare_worker_script" "example" {
  name      = var.cloudflare_worker_name
  content   = file("path/to/worker/script.js")
  account_id = var.cloudflare_account_id
}