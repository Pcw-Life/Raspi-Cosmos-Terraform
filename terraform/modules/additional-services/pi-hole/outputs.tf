
# Outputs for Pi-hole Module (Enhanced)

output "pihole_container_status" {
  value       = docker_container.pihole_container.status
  description = "The status of the Pi-hole container."
}

output "pihole_health_status" {
  value       = docker_container.pihole_container.health_status
  description = "The health status of the Pi-hole container."
}

output "pihole_admin_url" {
  value       = "http://${docker_container.pihole_container.name}:${var.pihole_external_port}/admin"
  description = "Admin URL for the Pi-hole instance."
}
