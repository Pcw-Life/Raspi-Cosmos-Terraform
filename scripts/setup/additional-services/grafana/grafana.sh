
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if Grafana is already running..."
  if docker ps --filter "name=grafana" | grep grafana &>/dev/null; then
    echo "Grafana is already running."
    exit 0
  fi

  echo "Starting Grafana container..."
  docker run -d --name grafana -p 3000:3000 -v /mnt/grafana/data:/var/lib/grafana     -e GF_SECURITY_ADMIN_USER=$ADMIN_USERNAME -e GF_SECURITY_ADMIN_PASSWORD=$ADMIN_PASSWORD     grafana/grafana
  echo "Grafana started successfully."

elif [[ "$ACTION" == "validate" ]]; then
  echo "Validating Grafana container..."
  if docker ps --filter "name=grafana" | grep grafana &>/dev/null; then
    echo "Grafana is running."
  else
    echo "Grafana is not running."
    exit 1
  fi

else
  echo "Unknown action: $ACTION"
  echo "Usage: $0 {install|validate}"
  exit 1
fi
