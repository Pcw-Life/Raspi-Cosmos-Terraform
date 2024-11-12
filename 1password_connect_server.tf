# 1Password Connect Server setup
resource "docker_container" "onepassword_connect" {
  image = "1password/connect-api:latest"
  name  = "onepassword_connect"
  ports {
    internal = 8080
    external = 8080
  }
  env {
    OP_API_TOKEN = var.onepassword_api_token
  }
}