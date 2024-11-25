# UniFi Controller Module (Enhanced)

# Pull the UniFi Controller Docker image
resource "docker_registry_image" "unifi_controller_image" {
  name         = "jacobalberty/unifi"
  keep_locally = true
}

# Create a Docker container for UniFi Controller
resource "docker_container" "unifi_controller_container" {
  image = docker_registry_image.unifi_controller_image.name
  name  = var.unifi_controller_container_name

  # Advanced container settings
  ports {
    internal = var.unifi_internal_port
    external = var.unifi_external_port
  }

  env = {
    UNIFI_UID     = var.unifi_uid
    UNIFI_API_KEY = var.unifi_api_key
  }

  volumes {
    container_path = var.container_volume_path
    host_path      = var.host_volume_path
  }

  # Health Check (Advanced)
  healthcheck {
    test     = ["CMD", "curl", "-f", "https://localhost:${var.unifi_internal_port}/api"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
}

# Create IP Group for Docker Domains
resource "unifi_firewall_group" "docker_domains" {
  name    = "Docker Domains"
  members = var.docker_domains
}

# Add Firewall Rule for Docker Domains
resource "unifi_firewall_rule" "allow_docker_domains" {
  name        = "Allow Docker Domains"
  rule_action = "accept"
  enabled     = true
  protocol    = "all"

  source {
    type  = "subnet"
    value = var.docker_source_subnet
  }

  destination {
    type  = "group"
    value = unifi_firewall_group.docker_domains.id
  }
}

# Outputs for UniFi Controller
output "unifi_controller_container_status" {
  value       = docker_container.unifi_controller_container.status
  description = "The status of the UniFi Controller container."
}

output "unifi_controller_health_check" {
  value       = docker_container.unifi_controller_container.health_status
  description = "Health status of the UniFi Controller container."
}

data "external" "iot_devices" {
  program = ["sh", "${path.module}/scripts/fetch_unifi_devices.sh"]
  query = {
    ssid = var.iot_ssid
    vlan = var.iot_vlan
  }
}

resource "unifi_firewall_group" "iot_devices" {
  name        = "IoT Devices"
  group_type  = "address"
  addresses   = [
    for d in data.external.iot_devices.result : d.mac
    if d.essid == var.iot_ssid && d.vlan == var.iot_vlan
  ]
  site_id     = var.site_id
}
