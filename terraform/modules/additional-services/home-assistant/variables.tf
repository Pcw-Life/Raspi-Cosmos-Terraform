
# Variables for Home Assistant Module (Enhanced)

variable "home_assistant_container_name" {
  description = "The name of the Home Assistant container."
  type        = string
  default     = "home-assistant"
}

variable "home_assistant_internal_port" {
  description = "Internal port for the Home Assistant container."
  type        = number
  default     = 8123
}

variable "home_assistant_external_port" {
  description = "External port mapping for the Home Assistant container."
  type        = number
  default     = 8123
}

variable "admin_email" {
  description = "Admin email for the Home Assistant setup."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Home Assistant setup."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Home Assistant setup."
  type        = string
  sensitive   = true
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/config"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/home-assistant/config"
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
