# Cosmos Cloud Setup
# Module to deploy Cosmos Cloud using Docker.

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "cosmos_cloud" {
  name = "azukaar/cosmos-server:latest"
}

resource "docker_container" "cosmos_cloud" {
  image = docker_image.cosmos_cloud.latest
  name  = "cosmos-server"

  network_mode = "host"

  volumes = [
    "/var/run/docker.sock:/var/run/docker.sock",
    "/var/lib/cosmos:/config"
  ]

  restart = "always"

  logs {
    enabled = true
    max_size = "10m"
    max_file = 5
  }
}

output "cosmos_container_status" {
  value = docker_container.cosmos_cloud.status
  description = "Status of the Cosmos Cloud container deployment."
}