# Variables for Pi-hole Configuration
variable "pihole_password" {
  description = "Password for the Pi-hole web interface"
  type        = string
}

variable "local_ipv4" {
  description = "Local IPv4 address for Pi-hole"
  type        = string
  default     = "192.168.1.100" # Update this to your local server IP
}

variable "pihole_timezone" {
  description = "Timezone for Pi-hole container"
  type        = string
  default     = "Etc/UTC"
}

# Pi-hole Docker Image
resource "docker_image" "pihole" {
  name = "pihole/pihole:latest"
}

# Pi-hole Docker Container
resource "docker_container" "pihole" {
  image = docker_image.pihole.name
  name  = "pihole"

  ports {
    internal = 53
    external = 53
    protocol = "tcp"
  }

  ports {
    internal = 53
    external = 53
    protocol = "udp"
  }

  ports {
    internal = 80
    external = 80
    protocol = "tcp"
  }

  volumes {
    container_path = "/etc/pihole"
    host_path      = "/etc/pihole"
  }

  volumes {
    container_path = "/etc/dnsmasq.d"
    host_path      = "/etc/dnsmasq.d"
  }

  env = [
    "TZ=${var.pihole_timezone}",
    "WEBPASSWORD=${var.pihole_password}",
    "FTLCONF_LOCAL_IPV4=${var.local_ipv4}"
  ]

  restart = "always"
}