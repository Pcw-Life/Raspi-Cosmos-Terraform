
# Outputs for Docker Module (Enhanced)

output "docker_image_name" {
  value       = docker_registry_image.docker_image.name
  description = "The name of the Docker image pulled."
}

output "docker_debug_mode" {
  value       = var.docker_debug_mode ? "Enabled" : "Disabled"
  description = "Status of debugging mode for Docker workflows."
}
