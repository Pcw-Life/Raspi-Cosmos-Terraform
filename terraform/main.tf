
# Main Terraform Configuration

# Terraform Version and Backend
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }
}

# Providers
provider "docker" {}
provider "http" {}
provider "null" {}

# Modules

## Docker Setup Module (Advanced)
module "docker" {
  source = "./modules/docker"

  docker_username = var.docker_username
  docker_password = var.docker_password
  docker_image_name = var.docker_image_name
  docker_container_name = var.docker_container_name
  container_internal_port = var.container_internal_port
  container_external_port = var.container_external_port
  container_environment_variables = var.container_environment_variables
  container_volume_path = var.container_volume_path
  host_volume_path = var.host_volume_path
}

## Cosmos Cloud Module (Depends on Docker being set up)
module "cosmos_cloud" {
  source      = "./modules/cosmos-cloud"
  admin_email = var.cosmos_admin_email
  username    = var.cosmos_username
  password    = var.cosmos_password
}

## 1Password Module
module "1password" {
  source        = "./modules/1password"
  connect_host  = var.op_connect_host
  connect_token = var.op_connect_token
}

## UniFi Controller Module
module "unifi" {
  source                           = "./modules/unifi"
  unifi_controller_container_name  = var.unifi_controller_container_name
  unifi_internal_port              = var.unifi_internal_port
  unifi_external_port              = var.unifi_external_port
  unifi_uid                        = var.unifi_uid
  unifi_api_key                    = var.unifi_api_key
  container_volume_path            = var.container_volume_path
  host_volume_path                 = var.host_volume_path
  docker_source_subnet             = var.docker_source_subnet
}

# Outputs
output "docker_container_status" {
  value       = module.docker.docker_container_status
  description = "Status of the main Docker container."
}

output "cosmos_url" {
  value       = module.cosmos_cloud.url
  description = "URL for the Cosmos Cloud instance."
}

output "1password_status" {
  value       = module.1password.status
  description = "Status of the 1Password Connect Server."
}

output "unifi_controller_status" {
  value       = module.unifi.unifi_controller_container_status
  description = "Status of the UniFi Controller container."
}

output "unifi_firewall_rule" {
  value       = module.unifi.allow_docker_domains_rule
  description = "Details of the Docker domains firewall rule."
}
