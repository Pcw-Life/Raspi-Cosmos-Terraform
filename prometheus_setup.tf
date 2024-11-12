# Prometheus setup
resource "docker_container" "prometheus" {
  image = "prom/prometheus:${var.prometheus_version}"
  name  = "prometheus"
  ports {
    internal = 9090
    external = 9090
  }
}