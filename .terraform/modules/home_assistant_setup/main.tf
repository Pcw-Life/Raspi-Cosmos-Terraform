# Home Assistant Setup
module "home_assistant" {
  source = "azukaar/cosmos-home-assistant/dockerhub"

  # Variables
  config_path = "/config/home-assistant"
}