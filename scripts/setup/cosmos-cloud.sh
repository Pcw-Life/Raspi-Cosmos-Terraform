
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Cosmos Cloud is already running..."
  if docker ps --filter "name=cosmos-cloud" | grep cosmos-cloud &>/dev/null; then
    echo "Cosmos Cloud is already running."
    exit 0
  fi

  echo "Starting Cosmos Cloud container..."
  docker run -d --name cosmos-cloud -p 8080:80 -v /mnt/cosmos/data:/cosmos/data     -e ADMIN_EMAIL=$ADMIN_EMAIL -e ADMIN_USER=$ADMIN_USERNAME -e ADMIN_PASS=$ADMIN_PASSWORD     pcwintegrates/pisoftware:cosmos-cloud
  echo "Cosmos Cloud started successfully."

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Cosmos Cloud container..."
  if docker ps --filter "name=cosmos-cloud" | grep cosmos-cloud &>/dev/null; then
    echo "Cosmos Cloud is running."
  else
    echo "Cosmos Cloud is not running."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
