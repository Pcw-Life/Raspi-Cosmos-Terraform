
# Outputs for Grafana Module (Enhanced)

output "grafana_container_status" {
  value       = docker_container.grafana_container.status
  description = "The status of the Grafana container."
}

output "grafana_health_status" {
  value       = docker_container.grafana_container.health_status
  description = "The health status of the Grafana container."
}

output "grafana_admin_url" {
  value       = "http://${docker_container.grafana_container.name}:${var.grafana_external_port}"
  description = "Admin URL for the Grafana instance."
}
