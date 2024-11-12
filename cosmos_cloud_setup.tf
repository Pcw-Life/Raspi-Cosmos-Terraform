# Cosmos Cloud setup
resource "docker_container" "cosmos_cloud" {
  image = "cosmoscloud/cosmos:${var.cosmos_cloud_version}"
  name  = "cosmos_cloud"
  ports {
    internal = 80
    external = 8080
  }
}