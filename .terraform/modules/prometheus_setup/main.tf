# Grafana Setup
module "grafana" {
  source = "cosmos-market/grafana"

  # Variables
  config_path = "/config/grafana"
}