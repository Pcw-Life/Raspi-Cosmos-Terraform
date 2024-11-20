# Cosmos Cloud Setup
module "cosmos_cloud" {
  source = "azukaar/cosmos-server/dockerhub"

  # Variables
  container_name = "cosmos-server"
  network_mode   = "host"
  volumes = [
    "/var/run/docker.sock:/var/run/docker.sock",
    "/var/lib/cosmos:/config"
  ]
}