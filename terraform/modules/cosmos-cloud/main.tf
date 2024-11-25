
# Cosmos Cloud Module (Enhanced)

# Pull the Cosmos Cloud Docker image
resource "docker_registry_image" "cosmos_image" {
  name         = var.cosmos_docker_image
  keep_locally = true
}

# Create a Docker container for Cosmos Cloud
resource "docker_container" "cosmos_container" {
  image = docker_registry_image.cosmos_image.name
  name  = var.cosmos_container_name

  # Advanced container settings
  ports {
    internal = var.cosmos_internal_port
    external = var.cosmos_external_port
  }

  env = {
    ADMIN_EMAIL = var.admin_email
    ADMIN_USER  = var.admin_username
    ADMIN_PASS  = var.admin_password
  }

  volumes {
    container_path = var.container_volume_path
    host_path      = var.host_volume_path
  }

  # Health Check (Advanced)
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost:${var.cosmos_internal_port}/health"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
}

# Outputs for Cosmos Cloud
output "cosmos_container_status" {
  value       = docker_container.cosmos_container.status
  description = "The status of the Cosmos Cloud container."
}

output "cosmos_admin_url" {
  value       = "http://${docker_container.cosmos_container.name}:${var.cosmos_external_port}/admin"
  description = "Admin URL for the Cosmos Cloud instance."
}
