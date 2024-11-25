
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Home Assistant is already running..."
  if docker ps --filter "name=home-assistant" | grep home-assistant &>/dev/null; then
    echo "Home Assistant is already running."
    exit 0
  fi

  echo "Starting Home Assistant container..."
  docker run -d --name home-assistant -p 8123:8123 -v /mnt/home-assistant/config:/config     -e ADMIN_EMAIL=$ADMIN_EMAIL -e ADMIN_USERNAME=$ADMIN_USERNAME -e ADMIN_PASSWORD=$ADMIN_PASSWORD     homeassistant/home-assistant
  echo "Home Assistant started successfully."

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Home Assistant container..."
  if docker ps --filter "name=home-assistant" | grep home-assistant &>/dev/null; then
    echo "Home Assistant is running."
  else
    echo "Home Assistant is not running."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
