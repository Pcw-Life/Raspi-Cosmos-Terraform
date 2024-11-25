
# Variables for Terraform configuration

# General Variables
variable "op_connect_host" {
  description = "The 1Password Connect Server host URL."
  type        = string
}

variable "op_connect_token" {
  description = "The API token for the 1Password Connect Server."
  type        = string
  sensitive   = true
}

variable "docker_username" {
  description = "Docker Hub username for authentication."
  type        = string
}

variable "docker_password" {
  description = "Docker Hub password for authentication."
  type        = string
  sensitive   = true
}

# Advanced Docker Options
variable "docker_image_name" {
  description = "The name of the Docker image to pull."
  type        = string
  default     = "hello-world"
}

variable "docker_container_name" {
  description = "The name of the Docker container."
  type        = string
  default     = "terraform-main-container"
}

variable "container_internal_port" {
  description = "Internal port for the container."
  type        = number
  default     = 80
}

variable "container_external_port" {
  description = "External port mapping for the container."
  type        = number
  default     = 8080
}

variable "container_environment_variables" {
  description = "Environment variables for the Docker container."
  type        = map(string)
  default     = {}
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/app/data"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/data"
}

# Cosmos Cloud Variables
variable "cosmos_admin_email" {
  description = "Admin email for the Cosmos Cloud setup."
  type        = string
}

variable "cosmos_username" {
  description = "Username for the Cosmos Cloud admin."
  type        = string
}

variable "cosmos_password" {
  description = "Password for the Cosmos Cloud admin."
  type        = string
  sensitive   = true
}
