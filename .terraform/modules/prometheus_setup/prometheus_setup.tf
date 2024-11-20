# Prometheus Setup
resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_container" "prometheus" {
  image = docker_image.prometheus.name
  name  = "prometheus"

  ports {
    internal = 9090
    external = 9090
    protocol = "tcp"
  }

  volumes {
    container_path = "/etc/prometheus"
    host_path      = "/config/prometheus"
  }

  env = [
    "TZ=Etc/UTC"
  ]

  restart = "always"
}

# Prometheus Configuration
resource "local_file" "prometheus_config" {
  filename = "/config/prometheus/prometheus.yml"
  content  = <<EOT
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
EOT
}