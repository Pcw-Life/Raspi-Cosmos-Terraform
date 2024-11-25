
#!/bin/bash

ACTION=$1

if [[ "$ACTION" == "install" ]]; then
  echo "Checking if 1Password Connect Server is installed..."
  if ! command -v op &>/dev/null; then
    echo "1Password CLI not found. Installing..."
    curl -sS https://downloads.1password.com/command-line/latest/linux/packages.tar.gz | tar -xz
    sudo mv op /usr/local/bin/
    echo "1Password CLI installed."
  fi
  
  echo "Checking if Connect Server is reachable..."
  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer $OP_CONNECT_TOKEN"     "$OP_CONNECT_HOST/v1/vaults")
  if [[ "$STATUS_CODE" == "200" ]]; then
    echo "1Password Connect Server is online."
  else
    echo "1Password Connect Server validation failed. Status code: $STATUS_CODE"
    exit 1
  fi
else
  echo "Unknown action: $ACTION"
  exit 1
fi
