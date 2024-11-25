
# Outputs for Terraform configuration

output "docker_container_status" {
  value       = module.docker.docker_container_status
  description = "Status of the main Docker container."
}

output "cosmos_url" {
  value       = module.cosmos_cloud.url
  description = "URL for the Cosmos Cloud instance."
}

output "1password_status" {
  value       = module.1password.status
  description = "Status of the 1Password Connect Server."
}
