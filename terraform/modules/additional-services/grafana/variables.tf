
# Variables for Grafana Module (Enhanced)

variable "grafana_container_name" {
  description = "The name of the Grafana container."
  type        = string
  default     = "grafana"
}

variable "grafana_internal_port" {
  description = "Internal port for the Grafana container."
  type        = number
  default     = 3000
}

variable "grafana_external_port" {
  description = "External port mapping for the Grafana container."
  type        = number
  default     = 3000
}

variable "admin_username" {
  description = "Admin username for the Grafana setup."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Grafana setup."
  type        = string
  sensitive   = true
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/var/lib/grafana"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/grafana/data"
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
