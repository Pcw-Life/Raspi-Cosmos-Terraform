
# Variables for Pi-hole Module (Enhanced)

variable "pihole_container_name" {
  description = "The name of the Pi-hole container."
  type        = string
  default     = "pihole"
}

variable "pihole_internal_port" {
  description = "Internal port for the Pi-hole container."
  type        = number
  default     = 80
}

variable "pihole_external_port" {
  description = "External port mapping for the Pi-hole container."
  type        = number
  default     = 8081
}

variable "admin_password" {
  description = "Admin password for the Pi-hole web interface."
  type        = string
  sensitive   = true
}

variable "timezone" {
  description = "Timezone for the Pi-hole container."
  type        = string
  default     = "UTC"
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/etc/pihole"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/pihole/data"
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
