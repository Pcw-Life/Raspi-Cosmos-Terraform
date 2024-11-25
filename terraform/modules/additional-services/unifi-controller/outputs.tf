
# Outputs for UniFi Controller Module (Enhanced)

output "unifi_controller_container_status" {
  value       = docker_container.unifi_controller_container.status
  description = "The status of the UniFi Controller container."
}

output "unifi_controller_health_status" {
  value       = docker_container.unifi_controller_container.health_status
  description = "The health status of the UniFi Controller container."
}

output "unifi_controller_url" {
  value       = "https://${docker_container.unifi_controller_container.name}:${var.unifi_external_port}"
  description = "URL for the UniFi Controller instance."
}
