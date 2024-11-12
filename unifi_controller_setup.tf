# UniFi Controller setup
resource "docker_container" "unifi_controller" {
  image = "jacobalberty/unifi:${var.unifi_version}"
  name  = "unifi_controller"
  ports {
    internal = 8443
    external = 8443
  }
  env {
    UNIFI_ADMIN_PASSWORD = var.unifi_admin_password
  }
}