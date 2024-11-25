
# Outputs for Home Assistant Module (Enhanced)

output "home_assistant_container_status" {
  value       = docker_container.home_assistant_container.status
  description = "The status of the Home Assistant container."
}

output "home_assistant_health_status" {
  value       = docker_container.home_assistant_container.health_status
  description = "The health status of the Home Assistant container."
}

output "home_assistant_url" {
  value       = "http://${docker_container.home_assistant_container.name}:${var.home_assistant_external_port}"
  description = "URL for the Home Assistant instance."
}
