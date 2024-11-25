
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Pi-hole is already running..."
  if docker ps --filter "name=pihole" | grep pihole &>/dev/null; then
    echo "Pi-hole is already running."
    exit 0
  fi

  echo "Starting Pi-hole container..."
  docker run -d --name pihole -p 8081:80 -v /mnt/pihole/data:/etc/pihole     -e TZ=$TIMEZONE -e WEBPASSWORD=$ADMIN_PASSWORD     pihole/pihole
  echo "Pi-hole started successfully."

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Pi-hole container..."
  if docker ps --filter "name=pihole" | grep pihole &>/dev/null; then
    echo "Pi-hole is running."
  else
    echo "Pi-hole is not running."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
