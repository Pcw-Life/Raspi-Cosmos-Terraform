
# Pi-hole Module (Enhanced)

# Pull the Pi-hole Docker image
resource "docker_registry_image" "pihole_image" {
  name         = "pihole/pihole"
  keep_locally = true
}

# Create a Docker container for Pi-hole
resource "docker_container" "pihole_container" {
  image = docker_registry_image.pihole_image.name
  name  = var.pihole_container_name

  # Advanced container settings
  ports {
    internal = var.pihole_internal_port
    external = var.pihole_external_port
  }

  env = {
    TZ           = var.timezone
    WEBPASSWORD  = var.admin_password
  }

  volumes {
    container_path = var.container_volume_path
    host_path      = var.host_volume_path
  }

  # Health Check (Advanced)
  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost/admin/index.php"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
}

# Outputs for Pi-hole
output "pihole_container_status" {
  value       = docker_container.pihole_container.status
  description = "The status of the Pi-hole container."
}

output "pihole_health_check" {
  value       = docker_container.pihole_container.health_status
  description = "Health status of the Pi-hole container."
}
