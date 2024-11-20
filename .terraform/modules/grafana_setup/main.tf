# Grafana Setup
module "grafana" {
  source = "azukaar/cosmos-grafana/dockerhub"

  # Variables
  config_path = "/config/grafana"
}