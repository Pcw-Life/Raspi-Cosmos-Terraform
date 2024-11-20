# Pi-hole setup using Docker
resource "docker_image" "pihole" {
  name = "pihole/pihole:latest"
}

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
    "TZ=Etc/UTC",
    "WEBPASSWORD=${var.pihole_password}",
    "FTLCONF_LOCAL_IPV4=${var.local_ipv4}"
  ]

  restart = "always"
}