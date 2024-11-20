# Variables for Grafana Configuration
variable "grafana_admin_user" {
  description = "Admin username for Grafana"
  type        = string
  default     = "admin"
}

variable "grafana_admin_password" {
  description = "Admin password for Grafana"
  type        = string
}

variable "grafana_data_path" {
  description = "Path to persist Grafana data"
  type        = string
  default     = "/config/grafana"
}

# Grafana Setup
resource "docker_container" "grafana" {
  image = "grafana/grafana:latest"
  name  = "grafana"

  ports {
    internal = 3000
    external = 3000
  }

  env {
    GF_SECURITY_ADMIN_USER     = var.grafana_admin_user
    GF_SECURITY_ADMIN_PASSWORD = var.grafana_admin_password
  }

  volumes {
    source      = var.grafana_data_path
    destination = "/var/lib/grafana"
  }

  restart = "always"
}