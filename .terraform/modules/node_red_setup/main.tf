# Node-RED Setup
module "node_red" {
  source = "azukaar/cosmos-node-red/dockerhub"

  # Variables
  config_path = "/config/node-red"
}