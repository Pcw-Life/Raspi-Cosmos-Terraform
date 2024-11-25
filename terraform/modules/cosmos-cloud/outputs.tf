
# Outputs for Cosmos Cloud Module (Enhanced)

output "cosmos_container_status" {
  value       = docker_container.cosmos_container.status
  description = "The status of the Cosmos Cloud container."
}

output "cosmos_health_status" {
  value       = docker_container.cosmos_container.health_status
  description = "The health status of the Cosmos Cloud container."
}

output "cosmos_admin_url" {
  value       = "http://${docker_container.cosmos_container.name}:${var.cosmos_external_port}/admin"
  description = "Admin URL for the Cosmos Cloud instance."
}
