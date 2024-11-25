
# Variables for Node-RED Module (Enhanced)

variable "node_red_container_name" {
  description = "The name of the Node-RED container."
  type        = string
  default     = "node-red"
}

variable "node_red_internal_port" {
  description = "Internal port for the Node-RED container."
  type        = number
  default     = 1880
}

variable "node_red_external_port" {
  description = "External port mapping for the Node-RED container."
  type        = number
  default     = 1880
}

variable "admin_username" {
  description = "Admin username for the Node-RED setup."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Node-RED setup."
  type        = string
  sensitive   = true
}

variable "container_volume_path" {
  description = "The path inside the container to mount a volume."
  type        = string
  default     = "/data"
}

variable "host_volume_path" {
  description = "The path on the host machine to mount as a volume."
  type        = string
  default     = "/mnt/node-red/data"
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
