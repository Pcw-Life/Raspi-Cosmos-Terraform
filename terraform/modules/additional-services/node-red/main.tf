
# Node-RED Module (Enhanced)

# Pull the Node-RED Docker image
resource "docker_registry_image" "node_red_image" {
  name         = "nodered/node-red"
  keep_locally = true
}

# Create a Docker container for Node-RED
resource "docker_container" "node_red_container" {
  image = docker_registry_image.node_red_image.name
  name  = var.node_red_container_name

  # Advanced container settings
  ports {
    internal = var.node_red_internal_port
    external = var.node_red_external_port
  }

  env = {
    ADMIN_USERNAME = var.admin_username
    ADMIN_PASSWORD = var.admin_password
  }

  volumes {
    container_path = var.container_volume_path
    host_path      = var.host_volume_path
  }

  # Health Check (Advanced)
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost:${var.node_red_internal_port}"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
}

# Outputs for Node-RED
output "node_red_container_status" {
  value       = docker_container.node_red_container.status
  description = "The status of the Node-RED container."
}

output "node_red_health_check" {
  value       = docker_container.node_red_container.health_status
  description = "Health status of the Node-RED container."
}
