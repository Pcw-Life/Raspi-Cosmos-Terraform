
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if UniFi Controller is already running..."
  if docker ps --filter "name=unifi-controller" | grep unifi-controller &>/dev/null; then
    echo "UniFi Controller is already running."
    exit 0
  fi

  echo "Starting UniFi Controller container..."
  docker run -d --name unifi-controller -p 8443:8443 -v /mnt/unifi/data:/unifi     -e UNIFI_UID=$UNIFI_UID -e UNIFI_API_KEY=$UNIFI_API_KEY     jacobalberty/unifi
  echo "UniFi Controller started successfully."

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating UniFi Controller container..."
  if docker ps --filter "name=unifi-controller" | grep unifi-controller &>/dev/null; then
    echo "UniFi Controller is running."
  else
    echo "UniFi Controller is not running."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
