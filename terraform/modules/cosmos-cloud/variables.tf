
# Variables for Cosmos Cloud Module (Enhanced)

variable "cosmos_docker_image" {
  description = "The Docker image for Cosmos Cloud."
  type        = string
  default     = "pcwintegrates/pisoftware:cosmos-cloud"
}

variable "cosmos_container_name" {
  description = "The name of the Cosmos Cloud container."
  type        = string
  default     = "cosmos-cloud"
}

variable "cosmos_internal_port" {
  description = "Internal port for the Cosmos Cloud container."
  type        = number
  default     = 80
}

variable "cosmos_external_port" {
  description = "External port mapping for the Cosmos Cloud container."
  type        = number
  default     = 8080
}

variable "admin_email" {
  description = "Admin email for the Cosmos Cloud setup."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Cosmos Cloud setup."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Cosmos Cloud setup."
  type        = string
  sensitive   = true
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/cosmos/data"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/cosmos/data"
}

variable "healthcheck_interval" {
  description = "Interval for container health checks."
  type        = string
  default     = "30s"
}

variable "healthcheck_timeout" {
  description = "Timeout for container health checks."
  type        = string
  default     = "10s"
}

variable "healthcheck_retries" {
  description = "Number of retries for container health checks."
  type        = number
  default     = 3
}
