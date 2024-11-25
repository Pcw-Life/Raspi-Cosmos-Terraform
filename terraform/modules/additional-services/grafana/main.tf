
# Variables for Grafana Module

variable "admin_username" {
  description = "Admin username for Grafana"
  type        = string
}

variable "admin_password" {
  description = "Admin password for Grafana"
  type        = string
  sensitive   = true
}

variable "grafana_api_token" {
  description = "API token for Grafana"
  type        = string
  sensitive   = true
}

variable "grafana_port" {
  description = "Port for Grafana"
  type        = number
  default     = 3000
}
