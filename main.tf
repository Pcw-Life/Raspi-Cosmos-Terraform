# Terraform main workflow
# This file initiates the modular setup for PCW|Integrates Smarthome System Development.

provider "cloudflare" {
  # Configure Cloudflare provider with your API token
  api_token = var.cloudflare_api_token
}

provider "docker" {
  # Docker provider configuration for managing containers
  host = "unix:///var/run/docker.sock"
}

# 1Password integration for managing secure credentials
module "1password_integration" {
  source = "./1password_integration"
  count  = var.install_onepassword ? 1 : 0
}

# Cosmos Cloud setup for front-end management
module "cosmos_cloud_setup" {
  source = "./cosmos_cloud_setup"
  count  = var.install_cosmos_cloud ? 1 : 0
}

# Home Assistant setup for smart home integration
module "home_assistant_setup" {
  source = "./home_assistant_setup"
  count  = var.install_home_assistant ? 1 : 0
}

# Node-RED setup for automation workflows
module "node_red_setup" {
  source = "./node_red_setup"
  count  = var.install_node_red ? 1 : 0
}

# Grafana for analytics and data visualization
module "grafana_setup" {
  source = "./grafana_setup"
  count  = var.install_grafana ? 1 : 0
}

# Prometheus for monitoring and alerting
module "prometheus_setup" {
  source = "./prometheus_setup"
  count  = var.install_prometheus ? 1 : 0
}

# UniFi Controller setup to integrate with Identity Enterprise
module "unifi_controller_setup" {
  source = "./unifi_controller_setup"
  count  = var.install_unifi ? 1 : 0
}

# Database setup for MySQL or MongoDB (select based on compatibility)
module "database_setup" {
  source = "./database_setup"
  count  = var.install_database ? 1 : 0
}

# 1Password Connect Server for API access across infrastructure
module "1password_connect_server" {
  source = "./1password_connect_server"
  count  = var.install_onepassword_connect ? 1 : 0
}

# GitHub CLI and additional VS Code extensions setup
module "vscode_extensions_setup" {
  source = "./vscode_extensions_setup"
  count  = var.install_vscode_extensions ? 1 : 0
}

# Cloudflare Workers for DDNS and additional services
module "cloudflare_workers" {
  source = "./cloudflare_workers"
  count  = var.install_cloudflare_workers ? 1 : 0
}