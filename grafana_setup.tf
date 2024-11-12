# Grafana setup
resource "docker_container" "grafana" {
  image = "grafana/grafana:${var.grafana_version}"
  name  = "grafana"
  ports {
    internal = 3000
    external = 3000
  }
  env {
    GF_SECURITY_ADMIN_PASSWORD = var.grafana_admin_password
  }
}