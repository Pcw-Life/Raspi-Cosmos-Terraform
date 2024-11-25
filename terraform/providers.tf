terraform {
  required_providers {
    onepassword = {
      source  = "1Password/onepassword"
      version = ">= 2.0.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.20.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.0.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.36.0"
    }
    prometheus = {
      source  = "terraform-providers/prometheus"
      version = ">= 1.0.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">= 1.5.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = ">= 3.12.0"
    }
    pihole = {
      source  = "ryanwholey/pihole"
      version = ">= 0.2.0"
    }
    portainer = {
      source  = "elestio/elestio"
      version = ">= 0.1.0"
    }
  }
}

provider "onepassword" {}

provider "docker" {}

provider "github" {
  token = var.github_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "prometheus" {}

provider "grafana" {}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

provider "pihole" {}

provider "portainer" {}
