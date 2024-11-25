
# Outputs for Node-RED Module (Enhanced)

output "node_red_container_status" {
  value       = docker_container.node_red_container.status
  description = "The status of the Node-RED container."
}

output "node_red_health_status" {
  value       = docker_container.node_red_container.health_status
  description = "The health status of the Node-RED container."
}

output "node_red_admin_url" {
  value       = "http://${docker_container.node_red_container.name}:${var.node_red_external_port}"
  description = "Admin URL for the Node-RED instance."
}
