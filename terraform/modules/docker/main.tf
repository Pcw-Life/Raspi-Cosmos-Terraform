
# Docker Module (Enhanced)

provider "docker" {}

# Authenticate with Docker Hub (optional for private images)
resource "docker_registry" "auth" {
  username = var.docker_username
  password = var.docker_password
}

# Pull the specified Docker image
resource "docker_registry_image" "docker_image" {
  name         = var.docker_image_name
  keep_locally = true
}

# Outputs for Docker Module
output "docker_image_name" {
  value       = docker_registry_image.docker_image.name
  description = "The name of the Docker image pulled."
}
