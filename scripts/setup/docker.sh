
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Docker is installed..."
  if ! command -v docker &>/dev/null; then
    echo "Docker not found. Installing..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
    echo "Docker installed successfully."
  else
    echo "Docker is already installed."
  fi

  echo "Validating Docker installation..."
  if docker info &>/dev/null; then
    echo "Docker is running and operational."
  else
    echo "Docker validation failed. Please check the Docker service."
    exit 1
  fi

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Docker setup..."
  if ! command -v docker &>/dev/null; then
    echo "Docker is not installed."
    exit 1
  fi

  if docker info &>/dev/null; then
    echo "Docker is running and operational."
  else
    echo "Docker validation failed. Please check the Docker service."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
