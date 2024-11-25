
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Node-RED is already running..."
  if docker ps --filter "name=node-red" | grep node-red &>/dev/null; then
    echo "Node-RED is already running."
    exit 0
  fi

  echo "Starting Node-RED container..."
  docker run -d --name node-red -p 1880:1880 -v /mnt/node-red/data:/data     -e ADMIN_USERNAME=$ADMIN_USERNAME -e ADMIN_PASSWORD=$ADMIN_PASSWORD     nodered/node-red
  echo "Node-RED started successfully."

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Node-RED container..."
  if docker ps --filter "name=node-red" | grep node-red &>/dev/null; then
    echo "Node-RED is running."
  else
    echo "Node-RED is not running."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
