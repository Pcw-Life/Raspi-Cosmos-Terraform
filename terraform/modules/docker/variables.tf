
# Variables for Docker Module (Enhanced)

variable "docker_username" {
  description = "Docker Hub username for authentication."
  type        = string
}

variable "docker_password" {
  description = "Docker Hub password for authentication."
  type        = string
  sensitive   = true
}

variable "docker_image_name" {
  description = "Name of the Docker image to pull."
  type        = string
}

variable "docker_debug_mode" {
  description = "Enable debugging for Docker workflows."
  type        = bool
  default     = false
}
