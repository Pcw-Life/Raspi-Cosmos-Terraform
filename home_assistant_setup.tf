# Home Assistant setup
resource "docker_container" "home_assistant" {
  image = "homeassistant/home-assistant:${var.home_assistant_version}"
  name  = "home_assistant"
  ports {
    internal = 8123
    external = 8123
  }
}