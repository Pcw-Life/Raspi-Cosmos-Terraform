# Variables for Home Assistant Configuration
variable "home_assistant_data_path" {
  description = "Path to persist Home Assistant data"
  type        = string
  default     = "/config/home-assistant"
}

variable "home_assistant_port" {
  description = "External port for accessing Home Assistant"
  type        = number
  default     = 8123
}

# Home Assistant Setup
resource "docker_container" "home_assistant" {
  image = "homeassistant/home-assistant:stable"
  name  = "home_assistant"

  ports {
    internal = 8123
    external = var.home_assistant_port
  }

  volumes {
    source      = var.home_assistant_data_path
    destination = "/config"
  }

  restart = "always"
}