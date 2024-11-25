
# Home Assistant Module (Enhanced)

# Pull the Home Assistant Docker image
resource "docker_registry_image" "home_assistant_image" {
  name         = "homeassistant/home-assistant"
  keep_locally = true
}

# Create a Docker container for Home Assistant
resource "docker_container" "home_assistant_container" {
  image = docker_registry_image.home_assistant_image.name
  name  = var.home_assistant_container_name

  # Advanced container settings
  ports {
    internal = var.home_assistant_internal_port
    external = var.home_assistant_external_port
  }

  env = {
    ADMIN_EMAIL    = var.admin_email
    ADMIN_USERNAME = var.admin_username
    ADMIN_PASSWORD = var.admin_password
  }

  volumes {
    container_path = var.container_volume_path
    host_path      = var.host_volume_path
  }

  # Health Check (Advanced)
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost:${var.home_assistant_internal_port}/api"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
}

# Outputs for Home Assistant
output "home_assistant_container_status" {
  value       = docker_container.home_assistant_container.status
  description = "The status of the Home Assistant container."
}

output "home_assistant_health_check" {
  value       = docker_container.home_assistant_container.health_status
  description = "Health status of the Home Assistant container."
}
