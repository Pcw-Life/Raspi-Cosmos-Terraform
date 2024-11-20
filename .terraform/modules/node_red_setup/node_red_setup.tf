# Variables for Node-RED Configuration
variable "node_red_data_path" {
  description = "Path to persist Node-RED data"
  type        = string
  default     = "/config/node-red"
}

variable "node_red_port" {
  description = "External port for accessing Node-RED"
  type        = number
  default     = 1880
}

# Node-RED Setup
resource "docker_container" "node_red" {
  image = "nodered/node-red:latest"
  name  = "node_red"

  ports {
    internal = 1880
    external = var.node_red_port
  }

  volumes {
    source      = var.node_red_data_path
    destination = "/data"
  }

  restart = "always"
}