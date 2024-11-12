# Node-RED setup
resource "docker_container" "node_red" {
  image = "nodered/node-red:latest"
  name  = "node_red"
  ports {
    internal = 1880
    external = 1880
  }
}